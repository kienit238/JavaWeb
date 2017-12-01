package Controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import javax.transaction.Transactional;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import Model.Depart;
import Model.Record;
import Model.Source;
import Model.Staff;


@Controller

@Transactional
@SuppressWarnings({ "unchecked", "static-access" })
@RequestMapping("Admin")
public class AdminController {
	@Autowired
	SessionFactory factory;
	ServletContext context;

	@RequestMapping("show")
	public String show() {
		return "Admin/show";
	}

	@RequestMapping("test")
	public String test(ModelMap model) {
		Session s = factory.getCurrentSession();
		String hql = "From Staff s where s.dept.ID=:id ";
		Query query = s.createQuery(hql);
		query.setParameter("id", "KD");
		List<Staff> ds = query.list();
		model.addAttribute("staff", ds);
		return "Admin/test";
	}

	// Upload file
	@RequestMapping("apply")
	public String apply(ModelMap model, @RequestParam("fullname") String fullname, @RequestParam("cv") MultipartFile cv,
			@RequestParam("photo") MultipartFile photo, HttpServletRequest request) {

		if (photo.isEmpty() || cv.isEmpty()) {
			model.addAttribute("message", "Vui lòng chọn file !");
		} else {
			try {
				String photoPath = context.getRealPath("/sources/Avatar" + photo.getOriginalFilename());
				photo.transferTo(new File(photoPath));
				String cvPath = context.getRealPath("/sources/Avatar" + cv.getOriginalFilename());
				cv.transferTo(new File(cvPath));
				model.addAttribute("photo_name", photo.getOriginalFilename());
				model.addAttribute("cv_name", cv.getOriginalFilename());
				model.addAttribute("cv_type", cv.getContentType());
				model.addAttribute("cv_size", cv.getSize());
				return "apply";
			} catch (Exception e) {
				model.addAttribute("message", "Lỗi lưu file !");
			}
		}
		return "form";
	}

	@RequestMapping("index")
	public String index() {
		return "Admin/blank";
	}

	@RequestMapping("viewDetail")
	public String view(@RequestParam("id") String id, ModelMap model) {
		Session s = factory.getCurrentSession();
		int ID = Integer.parseInt(id);
		String hql = "From Staff s where s.ID=:id";
		Query query = s.createQuery(hql);
		query.setParameter("id", ID);
		List<Staff> ds = query.list();
		model.addAttribute("staff", ds);
		return "Admin/viewdetail";
	}

	// Thông tin đánh giá nhân viên
	@RequestMapping("dataEvaluate")
	public String viewEvaluate(@RequestParam("id") String id, ModelMap model) {
		Session s = factory.getCurrentSession();
		int ID = Integer.parseInt(id);
		String hql = "Select r.st.Name from Record r where r.st.ID=:id Group By r.st.Name";
		Query query = s.createQuery(hql);
		query.setParameter("id", ID);
		List<Object[]> ds = query.list();
		model.addAttribute("r", ds);
		model.addAttribute("id", ID);
		System.out.println(ds.size());
		return "Admin/viewEvaluate";
	}

	// Xu ly chuc nang danh gia

	@RequestMapping("btnUpdateRecord")
	public String updateRecord(HttpServletRequest request) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		Record r = new Record();
		Staff st = new Staff();
		String name = "";
		String reason = "";
		String check = "";
		boolean evaluate = true;
		try {
			int id = Integer.parseInt(request.getParameter("id"));
			name = request.getParameter("name");
			reason = request.getParameter("reason");
			check = request.getParameter("check");
			evaluate = Boolean.parseBoolean(check);
			st.setID(id);
			r.setSt(st);
			r.setReason(reason);
			r.setType(evaluate);
			session.save(r);
			System.out.println(reason + evaluate + id);
			t.commit();
			return "redirect:/Admin/recordstaff.htm?view=recordstaff";

		} catch (Exception ex) {
			System.out.println(ex);

			t.rollback();
		} finally {
			session.close();
		}
		return "Admin/blank";
	}

	// In thong tin ra form de Edit
	@RequestMapping("Detail")
	public String detail(@RequestParam("id") String id, ModelMap model, @RequestParam("view") String page,
			HttpServletRequest request) {
		Session s = factory.getCurrentSession();
		int ID = Integer.parseInt(id);
		String hql = "From Staff s where s.ID=:id";
		Query query = s.createQuery(hql);
		query.setParameter("id", ID);
		List<Staff> ds = query.list();
		model.addAttribute("staff", ds);
		request.setAttribute("page", page);
		return "Admin/blank";
	}

	@RequestMapping("chuyentrang")
	public String test(HttpSession session, HttpServletRequest request, @RequestParam("view") String page) {

		if (page.equals("profile")) {
			request.setAttribute("page", page);
			return "Admin/blank";
		} else if (page.equals("depart")) {

			return "redirect:/Admin/showDepart.htm?view=depart";
		} else if (page.equals("staff")) {

			return "redirect:/Admin/showStaff.htm?view=staff";
		} else if (page.equals("top10")) {

			return "redirect:/Admin/showTop.htm?view=top10";
		} else if (page.equals("recordstaff")) {

			return "redirect:/Admin/recordstaff.htm?view=recordstaff";
		} else if (page.equals("source")) {
			request.setAttribute("page", page);
			return "redirect:showSource.htm";
		}

		return "redirect:/Home/index.htm";
	}

	// Show Thong tin Depart
	@RequestMapping("showDepart")
	public String showDepart(HttpSession session, HttpServletRequest request, @RequestParam("view") String page,
			ModelMap model, @RequestParam(value = "first", defaultValue = "0", required = false) int first,
			@RequestParam(value = "max", defaultValue = "6", required = false) int max) {
		Session s = factory.getCurrentSession();
		String hql = "From Depart";
		Query query = s.createQuery(hql);
		List<Depart> dsfull = query.list();
		query.setFirstResult(first);
		query.setMaxResults(max);
		List<Depart> dsphantrang = query.list();
		String size = String.valueOf(dsfull.size());
		request.setAttribute("size", size);
		request.setAttribute("page", page);
		request.setAttribute("first", first);
		request.setAttribute("max", max);
		model.addAttribute("depart", dsphantrang);

		return "Admin/blank";
	}

	// Show Thong tin Staff
	@RequestMapping("showStaff")
	public String showStaff(HttpSession session, HttpServletRequest request, @RequestParam("view") String page,
			ModelMap model, @RequestParam(value = "first", defaultValue = "0", required = false) int first,
			@RequestParam(value = "max", defaultValue = "6", required = false) int max) {
		String id = request.getParameter("id");
		String control = request.getParameter("control");
		if (control == null) {
			control = "insert";
		}
		Session s = factory.getCurrentSession();
		if (id != null) {
			int ID = Integer.parseInt(id);
			String hql3 = "From Staff s where s.ID=:id";
			Query query3 = s.createQuery(hql3);
			query3.setParameter("id", ID);
			List<Staff> dsstaffofid = query3.list();
			request.setAttribute("ID", ID);
			model.addAttribute("staffofid", dsstaffofid);
		}

		String hql = "From Staff";
		String hql2 = "From Depart";

		Query query1 = s.createQuery(hql);
		List<Staff> dsdepart = query1.list();
		query1.setFirstResult(first);
		query1.setMaxResults(max);
		Query query2 = s.createQuery(hql2);
		List<Staff> dsstaff = query1.list();

		String size = String.valueOf(dsdepart.size());
		List<Depart> dept = query2.list();
		request.setAttribute("first", first);
		request.setAttribute("max", max);
		request.setAttribute("size", size);
		model.addAttribute("staff", dsstaff);
		model.addAttribute("depart", dept);
		request.setAttribute("page", page);
		request.setAttribute("control", control);
		// System.out.println(ds2.size());
		return "Admin/blank";
	}

	// Show Thong tin Staff dua theo Phong ban
	@RequestMapping("showStaffofDepart")
	public String showStaffofDepart(HttpSession session, HttpServletRequest request, @RequestParam("view") String page,
			ModelMap model, @RequestParam("id") String id,
			@RequestParam(value = "first", defaultValue = "0", required = false) int first,
			@RequestParam(value = "max", defaultValue = "6", required = false) int max) {
		Session s = factory.getCurrentSession();
		String hql = "From Staff s where s.dept.ID=:id";
		String hql2 = "From Depart";
		Query query = s.createQuery(hql);
		query.setParameter("id", id);
		Query query2 = s.createQuery(hql2);
		List<Staff> ds = query.list();
		List<Depart> dept = query2.list();
		String size = String.valueOf(ds.size());
		request.setAttribute("page", page);
		request.setAttribute("first", first);
		request.setAttribute("max", max);
		request.setAttribute("size", size);
		model.addAttribute("staff", ds);
		model.addAttribute("depart", dept);
		return "Admin/blank";
	}

	// Show Thong tin Top10
	@RequestMapping("showTop")
	public String showTop(HttpSession session, HttpServletRequest request, @RequestParam("view") String page,
			ModelMap model) {
		Session s = factory.getCurrentSession();
		String hql = "From Staff";
		Query query = s.createQuery(hql);
		query.setFirstResult(0);
		query.setMaxResults(10);
		List<Staff> ds = query.list();
		request.setAttribute("page", page);
		model.addAttribute("top10", ds);
		return "Admin/blank";
	}

	// Xu ly chuc nang Update Staff

	@SuppressWarnings("unused")
	@RequestMapping(params = "btnUpdateStaff")
	public String update(HttpServletRequest request, @RequestParam CommonsMultipartFile[] fileUpload) {

		Session session = factory.openSession();
		Transaction t = session.beginTransaction(); // import hibernate
		String urlfile = "/sources/Download";
		String path = "";

		ServletContext context = request.getServletContext();
		String saveDirectory = context.getRealPath("") + urlfile;

		try {

			if (fileUpload != null && fileUpload.length > 0) {
				for (CommonsMultipartFile aFile : fileUpload) {

					System.out.println("Saving file: " + aFile.getOriginalFilename());

					if (!aFile.getOriginalFilename().equals("")) {
						path = urlfile + "/" + aFile.getOriginalFilename();
						aFile.transferTo(new File(saveDirectory + "/" + aFile.getOriginalFilename()));
					}
				}
			}
			Date birth = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("birthday"));
			int ID = Integer.parseInt(request.getParameter("id"));
			int salary = Integer.parseInt(request.getParameter("salary"));
			String hql = "";

			Query query = null;
			boolean g = Boolean.parseBoolean(request.getParameter("gender"));
			boolean roles = Boolean.parseBoolean(request.getParameter("role"));
			System.out.println(path);
			hql = "Update Staff s set s.Name=:name, s.Gender=:gender,s.Birthday=:birthday,s.Email=:email,s.Phone=:phone,s.Salary=:salary,s.dept.ID=:id,s.Username=:username,s.Role=:role";
			if (path.length() > 0) {
				hql = hql + ",s.Avatar=:url";
			}
			hql = hql + " where s.ID=:ID";

			query = session.createQuery(hql);
			query.setParameter("name", request.getParameter("name"));
			query.setParameter("gender", g);
			query.setParameter("birthday", birth);
			query.setParameter("email", request.getParameter("email"));
			query.setParameter("phone", request.getParameter("phone"));
			query.setParameter("salary", salary);
			query.setParameter("id", request.getParameter("depart"));
			query.setParameter("username", request.getParameter("username"));
			query.setParameter("role", roles);
			if (path.length() > 0) {
				query.setParameter("url", path);
			}
			query.setParameter("ID", ID);
			System.out.println(request.getParameter("name"));
			int result = query.executeUpdate();
			if (result > 0) {
				t.commit();
				System.out.println("Success");
				return "redirect:/Admin/showStaff.htm?view=staff";
			}

		} catch (Exception ex) {
			t.rollback();
			System.out.println(ex);
			System.out.println("Error");
			// System.out.println(list.get(0).toString());
		} finally {
			session.close();
		}

		return "Admin/blank";
	}

	// Xu ly chuc nang Insert

	@RequestMapping(params = "btnInsertStaff")
	public String insert(HttpServletRequest request, @RequestParam CommonsMultipartFile[] fileUpload) {
		Depart dept = new Depart();
		Session session = factory.openSession();
		Transaction t = session.beginTransaction(); // import hibernate
		Staff st = new Staff();
		String urlfile = "/sources/Download";
		String path = "";

		ServletContext context = request.getServletContext();
		String saveDirectory = context.getRealPath("") + urlfile;
		try {
			if (fileUpload != null && fileUpload.length > 0) {
				for (CommonsMultipartFile aFile : fileUpload) {

					System.out.println("Saving file: " + aFile.getOriginalFilename());

					if (!aFile.getOriginalFilename().equals("")) {
						path = urlfile + "/" + aFile.getOriginalFilename();
						aFile.transferTo(new File(saveDirectory + "/" + aFile.getOriginalFilename()));
					}
				}
			}
			Date birth = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("birthday"));
			// int ID=Integer.parseInt(request.getParameter("id"));
			int salary = Integer.parseInt(request.getParameter("salary"));
			String gt = request.getParameter("gender");
			boolean g = Boolean.parseBoolean(gt);
			boolean role = Boolean.parseBoolean(request.getParameter("role"));
			st.setName(request.getParameter("name"));
			st.setBirthday(birth);
			st.setGender(g);
			st.setUsername(request.getParameter("username"));
			st.setEmail(request.getParameter("email"));
			st.setSalary(salary);
			dept.setID(request.getParameter("depart"));
			st.setDept(dept);
			st.setRole(role);
			st.setAvatar(path);
			session.save(st);
			t.commit();
			System.out.println("Success");
			return "redirect:/Admin/showStaff.htm?view=staff";

		} catch (Exception ex) {
			t.rollback();
			System.out.println(ex);
		} finally {
			session.close();
		}

		return "Admin/blank";
	}

	// Delete Staff
	@RequestMapping("btnDeleteStaff")
	public String delete(HttpServletRequest request) {
		Staff st = new Staff();
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			int id = Integer.parseInt(request.getParameter("id"));
			st.setID(id);
			session.delete(st);
			// System.out.println(id);
			t.commit();
			return "redirect:showStaff.htm?view=staff";
		} catch (Exception ex) {
			t.rollback();
			System.out.println(ex);
		} finally {
			session.close();
		}
		return "Admin/blank";
	}

	// Lay thong tin dua ra form de Update
	@RequestMapping("dataEdit")
	public String data(@RequestParam("id") String id, HttpServletRequest request, ModelMap model, HttpSession s) {
		Session session = factory.getCurrentSession();
		String hql = "From Depart d where d.ID=:id";
		Query query = session.createQuery(hql);
		query.setParameter("id", id);
		List<Depart> ds = query.list();
		s.setAttribute("id", ds.get(0).getID());
		s.setAttribute("name", ds.get(0).getName());
		System.out.println(ds.get(0).getName());
		return "Admin/editDepart";
	}

	// Xu ly chuc nang Update Depart

	@RequestMapping("btnUpdateDepart")
	public String updateDepart(HttpServletRequest request) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		Depart dept = new Depart();
		String id = "";
		String name = "";
		try {
			id = request.getParameter("id");
			name = request.getParameter("name");
			dept.setID(id);
			dept.setName(name);
			session.update(dept);
			t.commit();
			System.out.println("Success");
			return "redirect:/Admin/showDepart.htm?view=depart";
		} catch (Exception ex) {
			System.out.println(ex);

			t.rollback();
		} finally {
			session.close();
		}
		return "Admin/blank";
	}

	// Xu ly chuc nang Insert Depart

	@RequestMapping("btnInsertDepart")
	public String insertDepart(HttpServletRequest request) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		Depart dept = new Depart();

		try {
			String id = request.getParameter("id");
			String name = request.getParameter("name");
			dept.setID(id);
			dept.setName(name);
			session.save(dept);
			t.commit();
			System.out.println("Success");
			return "redirect:/Admin/showDepart.htm?view=depart";
		} catch (Exception ex) {
			System.out.println(ex);

			t.rollback();
		} finally {
			session.close();
		}
		return "Admin/blank";
	}

	// Delete Depart
	@RequestMapping("btnDeleteDepart")
	public String deleteDepart(HttpServletRequest request) {
		Depart dept = new Depart();
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			String id = request.getParameter("id");
			dept.setID(id);
			session.delete(dept);
			t.commit();
			// System.out.println("Success");
			return "redirect:showDepart.htm?view=depart";
		} catch (Exception ex) {
			t.rollback();
			System.out.println(ex);
		} finally {
			session.close();
		}
		return "Admin/blank";
	}

	// Lay thong tin ID de Delete
	@RequestMapping("dataDelete")
	public String dataDelete(@RequestParam("id") String id, HttpServletRequest request, ModelMap model, HttpSession s) {
		model.addAttribute("id", id);
		return "Admin/delete";
	}

	// Show Record Staff
	@RequestMapping("recordstaff")
	public String rstaff(ModelMap model, @RequestParam("view") String page, HttpServletRequest request,
			@RequestParam(value = "first", defaultValue = "0", required = false) int first,
			@RequestParam(value = "max", defaultValue = "6", required = false) int max) {
		Session session = factory.getCurrentSession();
		String id = request.getParameter("id");

		if (id != null) {
			String hql2 = "Select r.st.Name," + " Sum(case when r.Type=True then 1 else 0 end),"
					+ "Sum(case when r.Type=False then 1 else 0 end), r.st.dept.Name, r.st.ID " + "From Record r"
					+ " Where r.st.dept.ID=:id" + " Group By r.st.Name, r.st.dept.Name, r.st.ID";

			Query query2 = session.createQuery(hql2);
			query2.setParameter("id", id);
			List<Object[]> dsfull = query2.list();
			query2.setFirstResult(first);
			query2.setMaxResults(max);
			List<Object[]> dspt = query2.list();
			model.addAttribute("rstaff", dspt);

			String size = String.valueOf(dsfull.size());
			request.setAttribute("size", size);
			System.out.println(id);
		} else {
			String hql = "Select r.st.Name," + " Sum(case when r.Type=True then 1 else 0 end),"
					+ "Sum(case when r.Type=False then 1 else 0 end), r.st.dept.Name, r.st.ID " + " From Record r"
					+ " Group By r.st.Name, r.st.dept.Name, r.st.ID";

			Query query = session.createQuery(hql);
			String hqlstaff = "From Staff";
			Query querystaff = session.createQuery(hqlstaff);
			List<Staff> ds = querystaff.list();
			model.addAttribute("staff", ds);
			List<Object[]> dsfull = query.list();
			query.setFirstResult(first);
			query.setMaxResults(max);
			List<Object[]> dspt = query.list();
			String size = String.valueOf(dsfull.size());
			request.setAttribute("size", size);
			model.addAttribute("rstaff", dspt);
			System.out.println(id);
		}

		String hqldepart = "From Depart";
		Query querydept = session.createQuery(hqldepart);
		List<Depart> dsdept = querydept.list();
		request.setAttribute("first", first);
		request.setAttribute("max", max);
		model.addAttribute("dept", dsdept);
		request.setAttribute("page", page);
		return "Admin/blank";
	}

	// Insert Record
	@RequestMapping(params = "btnInsertRecord")
	public String insertRecord(HttpServletRequest request, ModelMap model) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		Record r = new Record();
		Staff st = new Staff();
		try {
			String select = request.getParameter("emp");
			int id = Integer.parseInt(select);
			String reason = request.getParameter("reason");
			String evaluate = request.getParameter("check");
			boolean check = Boolean.parseBoolean(evaluate);
			st.setID(id);
			r.setSt(st);
			r.setType(check);
			r.setReason(reason);
			session.save(r);
			t.commit();
		} catch (Exception ex) {
			t.rollback();
			System.out.println(ex);
		} finally {
			session.close();
		}
		model.addAttribute("view", "recordstaff");
		return "redirect:Admin/recordstaff.htm";
	}

	// Show Record Staff dua theo Phong ban
	@RequestMapping("showRstaffofDepart")
	public String showRstaffofDepart(HttpSession session, HttpServletRequest request, @RequestParam("view") String page,
			ModelMap model, @RequestParam("id") String id,
			@RequestParam(value = "first", defaultValue = "0", required = false) int first,
			@RequestParam(value = "max", defaultValue = "6", required = false) int max) {
		Session s = factory.getCurrentSession();
		String hql1 = "Select r.st.Name," + " Sum(case when r.Type=True then 1 else 0 end),"
				+ "Sum(case when r.Type=False then 1 else 0 end), r.st.dept.Name, r.st.dept.ID " + "From Record r"
				+ " Group By r.st.Name, r.st.dept.Name, r.st.dept.ID ";
		String hql2 = "Select r.st.Name," + " Sum(case when r.Type=True then 1 else 0 end),"
				+ "Sum(case when r.Type=False then 1 else 0 end), r.st.dept.Name, r.st.dept.ID " + "From Record r"
				+ " Group By r.st.Name, r.st.dept.Name, r.st.dept.ID where r.st.dept.ID:=id";
		Query query1 = s.createQuery(hql1);
		Query query2 = s.createQuery(hql2);
		query2.setParameter("id", id);
		List<Object[]> dsfull = query1.list();
		List<Object[]> dspt = query2.list();
		String size = String.valueOf(dsfull.size());
		request.setAttribute("page", page);
		request.setAttribute("first", first);
		request.setAttribute("max", max);
		request.setAttribute("size", size);
		model.addAttribute("rstaff", dspt);
		return "Admin/blank";
	}

	// Download file
	@RequestMapping("download")
	public String download(HttpServletRequest request, HttpServletResponse response, @RequestParam("url") String url)
			throws IOException {
		ServletContext context = request.getServletContext();
		String appPath = context.getRealPath("");

		String filePath = url;

		final int BUFFER_SIZE = 4096;
		// construct the complete absolute path of the file
		String fullPath = appPath + filePath;
		System.out.println("fullPath = " + fullPath);
		File downloadFile = new File(fullPath);
		FileInputStream inputStream = new FileInputStream(downloadFile);

		// get MIME type of the file
		String mimeType = context.getMimeType(fullPath);
		if (mimeType == null) {
			// set to binary type if MIME mapping not found
			mimeType = "application/octet-stream";
		}
		System.out.println("MIME type: " + mimeType);

		// set content attributes for the response
		response.setContentType(mimeType);
		response.setContentLength((int) downloadFile.length());

		// set headers for the response
		String headerKey = "Content-Disposition";
		String headerValue = String.format("attachment; filename=\"%s\"", downloadFile.getName());
		response.setHeader(headerKey, headerValue);

		// get output stream of the response
		OutputStream outStream = response.getOutputStream();

		byte[] buffer = new byte[BUFFER_SIZE];
		int bytesRead = -1;

		// write bytes read from the input stream into the output stream
		while ((bytesRead = inputStream.read(buffer)) != -1) {
			outStream.write(buffer, 0, bytesRead);
		}

		inputStream.close();
		outStream.close();
		return "redirect:index.htm";

	}

	// Show du lieu table Source
	@RequestMapping("showSource")
	public String showSource(ModelMap model) {
		Session session = factory.getCurrentSession();
		String hql = "From Source";
		Query query = session.createQuery(hql);
		List<Source> ds = query.list();
		model.addAttribute("source", ds);
		model.addAttribute("page", "source");
		return "Admin/blank";
	}

	// Upload File source
	@RequestMapping("uploadSource")
	public String uploadSource(HttpServletRequest request, @RequestParam CommonsMultipartFile[] fileUpload,
			ModelMap model) {

		String urlfile = "/sources/Download";
		String path = "";
		String name = "";
		ServletContext context = request.getServletContext();
		String saveDirectory = context.getRealPath("") + urlfile;
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		Source s = new Source();
		try {

			if (fileUpload != null && fileUpload.length > 0) {
				for (CommonsMultipartFile aFile : fileUpload) {

					System.out.println("Saving file: " + aFile.getOriginalFilename());

					if (!aFile.getOriginalFilename().equals("")) {
						name = aFile.getOriginalFilename();
						path = urlfile + "/" + aFile.getOriginalFilename();
						aFile.transferTo(new File(saveDirectory + "/" + aFile.getOriginalFilename()));
					}
				}
			}
			s.setUrl(path);
			s.setName(name);
			session.save(s);
			t.commit();
			model.addAttribute("page", "source");
		} catch (Exception ex) {
			t.rollback();
			model.addAttribute("message", "Upload không thành công!");
			System.out.println(ex);
		} finally {
			session.close();
		}

		return "redirect:showSource.htm";
	}
}
