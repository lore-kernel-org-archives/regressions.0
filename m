Received: from mta22.hihonor.com (mta22.honor.com [81.70.192.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8822D27B323
	for <regressions@lists.linux.dev>; Mon, 18 Aug 2025 12:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=81.70.192.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755520269; cv=none; b=k1GN79F5htOSVijRE9wR6e6bRc8L+z3qNBK+mrQ6e+7aqUekwiVp42KYocvGtEkYGpj/EoH4BKFtNJSMEyEvyX4zov+0sC7qX4lCpwYUfoYdy+UnoIkg6ZURuR9zDlaC2684PO6fgYF9VGQWzp0i4V92HH9Pp2kb92VUfdVJFkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755520269; c=relaxed/simple;
	bh=4U2B/X3PRDwfwp26Gl11jaTCuX399Kk4OZWVEFIKFIo=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=cuqI3phC9Zjc1lN6bkl1VFPmrVoWK8Pf1gchrHvx7mNEEYHLwkDICql/9LyH5A9qG8sHTJKttOfNxCzbsYyjLVjUi1F8iXf6JrIUz08eeO5QkDxKfoB/KzeEFm4vQklZtIo812kGHIlJceT08DzMJjVsh+4QBO5P0FqQ+hVa5So=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=honor.com; spf=pass smtp.mailfrom=honor.com; dkim=pass (1024-bit key) header.d=honor.com header.i=@honor.com header.b=V8apBO3p; arc=none smtp.client-ip=81.70.192.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=honor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=honor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=honor.com header.i=@honor.com header.b="V8apBO3p"
dkim-signature: v=1; a=rsa-sha256; d=honor.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=To:From;
	bh=0Gm2+0Aa6dZlz65Fncjx6A1ibL2iyGuaPR5i1Xp2Ln0=;
	b=V8apBO3pUxsnyYSwLu+8vq+IdZtxaSunARICmPjOEaDUsSrQvZR3EUEcWe/BYV6IDbczNHCJS
	L0wO/XeEwVPYG/GVA3MoHsB8In9doPEupFD7awI97Dm0tShcVbBp3aEvXiXwSG11DF049qw4A3n
	UMtxRhTjmZv4jH8hOhybQZc=
Received: from w002.hihonor.com (unknown [10.68.28.120])
	by mta22.hihonor.com (SkyGuard) with ESMTPS id 4c5Brv3MCGzYlTHY;
	Mon, 18 Aug 2025 20:30:55 +0800 (CST)
Received: from a011.hihonor.com (10.68.31.243) by w002.hihonor.com
 (10.68.28.120) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 18 Aug
 2025 20:31:03 +0800
Received: from localhost.localdomain (10.144.23.14) by a011.hihonor.com
 (10.68.31.243) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 18 Aug
 2025 20:31:03 +0800
From: wangzijie <wangzijie1@honor.com>
To: <akpm@linux-foundation.org>, <viro@zeniv.linux.org.uk>,
	<adobriyan@gmail.com>, <rick.p.edgecombe@intel.com>, <ast@kernel.org>,
	<k.shutemov@gmail.com>, <jirislaby@kernel.org>,
	<linux-fsdevel@vger.kernel.org>
CC: <polynomial-c@gmx.de>, <gregkh@linuxfoundation.org>,
	<stable@vger.kernel.org>, <regressions@lists.linux.dev>, wangzijie
	<wangzijie1@honor.com>
Subject: [PATCH RESEND v2] proc: fix missing pde_set_flags() for net proc files
Date: Mon, 18 Aug 2025 20:31:02 +0800
Message-ID: <20250818123102.959595-1-wangzijie1@honor.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: w011.hihonor.com (10.68.20.122) To a011.hihonor.com
 (10.68.31.243)

To avoid potential UAF issues during module removal races, we use pde_set_flags()
to save proc_ops flags in PDE itself before proc_register(), and then use
pde_has_proc_*() helpers instead of directly dereferencing pde->proc_ops->*.

However, the pde_set_flags() call was missing when creating net related proc files.
This omission caused incorrect behavior which FMODE_LSEEK was being cleared
inappropriately in proc_reg_open() for net proc files. Lars reported it in this link[1].

Fix this by ensuring pde_set_flags() is called when register proc entry, and add
NULL check for proc_ops in pde_set_flags().

[1]: https://lore.kernel.org/all/20250815195616.64497967@chagall.paradoxon.rec/

Fixes: ff7ec8dc1b64 ("proc: use the same treatment to check proc_lseek as ones for proc_read_iter et.al)
Cc: stable@vger.kernel.org
Reported-by: Lars Wendler <polynomial-c@gmx.de>
Signed-off-by: wangzijie <wangzijie1@honor.com>
---
v2:
- followed by Jiri's suggestion to refractor code and reformat commit message
---
 fs/proc/generic.c | 36 +++++++++++++++++++-----------------
 1 file changed, 19 insertions(+), 17 deletions(-)

diff --git a/fs/proc/generic.c b/fs/proc/generic.c
index 76e800e38..003031839 100644
--- a/fs/proc/generic.c
+++ b/fs/proc/generic.c
@@ -367,6 +367,23 @@ static const struct inode_operations proc_dir_inode_operations = {
 	.setattr	= proc_notify_change,
 };
 
+static void pde_set_flags(struct proc_dir_entry *pde)
+{
+	if (!pde->proc_ops)
+		return;
+
+	if (pde->proc_ops->proc_flags & PROC_ENTRY_PERMANENT)
+		pde->flags |= PROC_ENTRY_PERMANENT;
+	if (pde->proc_ops->proc_read_iter)
+		pde->flags |= PROC_ENTRY_proc_read_iter;
+#ifdef CONFIG_COMPAT
+	if (pde->proc_ops->proc_compat_ioctl)
+		pde->flags |= PROC_ENTRY_proc_compat_ioctl;
+#endif
+	if (pde->proc_ops->proc_lseek)
+		pde->flags |= PROC_ENTRY_proc_lseek;
+}
+
 /* returns the registered entry, or frees dp and returns NULL on failure */
 struct proc_dir_entry *proc_register(struct proc_dir_entry *dir,
 		struct proc_dir_entry *dp)
@@ -374,6 +391,8 @@ struct proc_dir_entry *proc_register(struct proc_dir_entry *dir,
 	if (proc_alloc_inum(&dp->low_ino))
 		goto out_free_entry;
 
+	pde_set_flags(dp);
+
 	write_lock(&proc_subdir_lock);
 	dp->parent = dir;
 	if (pde_subdir_insert(dir, dp) == false) {
@@ -561,20 +580,6 @@ struct proc_dir_entry *proc_create_reg(const char *name, umode_t mode,
 	return p;
 }
 
-static void pde_set_flags(struct proc_dir_entry *pde)
-{
-	if (pde->proc_ops->proc_flags & PROC_ENTRY_PERMANENT)
-		pde->flags |= PROC_ENTRY_PERMANENT;
-	if (pde->proc_ops->proc_read_iter)
-		pde->flags |= PROC_ENTRY_proc_read_iter;
-#ifdef CONFIG_COMPAT
-	if (pde->proc_ops->proc_compat_ioctl)
-		pde->flags |= PROC_ENTRY_proc_compat_ioctl;
-#endif
-	if (pde->proc_ops->proc_lseek)
-		pde->flags |= PROC_ENTRY_proc_lseek;
-}
-
 struct proc_dir_entry *proc_create_data(const char *name, umode_t mode,
 		struct proc_dir_entry *parent,
 		const struct proc_ops *proc_ops, void *data)
@@ -585,7 +590,6 @@ struct proc_dir_entry *proc_create_data(const char *name, umode_t mode,
 	if (!p)
 		return NULL;
 	p->proc_ops = proc_ops;
-	pde_set_flags(p);
 	return proc_register(parent, p);
 }
 EXPORT_SYMBOL(proc_create_data);
@@ -636,7 +640,6 @@ struct proc_dir_entry *proc_create_seq_private(const char *name, umode_t mode,
 	p->proc_ops = &proc_seq_ops;
 	p->seq_ops = ops;
 	p->state_size = state_size;
-	pde_set_flags(p);
 	return proc_register(parent, p);
 }
 EXPORT_SYMBOL(proc_create_seq_private);
@@ -667,7 +670,6 @@ struct proc_dir_entry *proc_create_single_data(const char *name, umode_t mode,
 		return NULL;
 	p->proc_ops = &proc_single_ops;
 	p->single_show = show;
-	pde_set_flags(p);
 	return proc_register(parent, p);
 }
 EXPORT_SYMBOL(proc_create_single_data);
-- 
2.25.1

