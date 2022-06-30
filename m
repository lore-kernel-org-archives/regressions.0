Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAA127B
	for <regressions@lists.linux.dev>; Thu, 30 Jun 2022 11:37:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C336C34115;
	Thu, 30 Jun 2022 11:37:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1656589030;
	bh=cGCEH/g1pQl3ApIWI9DT5/59sWZXsyrbsY6MpfbqWgQ=;
	h=Subject:To:Cc:From:Date:In-Reply-To:From;
	b=eLFSRc+kpwaY0eoJR/6TSOmE0wK0bz/xlwf226QrDEmJM2qqsmbAHkXoX9hp1+ChI
	 v9+LSVmkdOLBNdD6xtw9nFPaUTwuhVRcaImXtHQnbmuXSBQSxY6+fpfWe8FW+4cIP/
	 dI0zkHCrNFh6GOGT2Hx06kTMnPv3WGW9Wu40z6BU=
Subject: Patch "fs: fix acl translation" has been added to the 5.15-stable tree
To: brauner@kernel.org,gregkh@linuxfoundation.org,hch@lst.de,regressions@lists.linux.dev,sforshee@digitalocean.com,torvalds@linux-foundation.org
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Thu, 30 Jun 2022 13:36:57 +0200
In-Reply-To: <20220628121620.188722-12-brauner@kernel.org>
Message-ID: <1656589017124184@kroah.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
X-stable: commit
X-Patchwork-Hint: ignore 


This is a note to let you know that I've just added the patch titled

    fs: fix acl translation

to the 5.15-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     fs-fix-acl-translation.patch
and it can be found in the queue-5.15 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From foo@baz Thu Jun 30 01:35:30 PM CEST 2022
From: Christian Brauner <brauner@kernel.org>
Date: Tue, 28 Jun 2022 14:16:19 +0200
Subject: fs: fix acl translation
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Christian Brauner <brauner@kernel.org>, stable@vger.kernel.org
Message-ID: <20220628121620.188722-12-brauner@kernel.org>

From: Christian Brauner <brauner@kernel.org>

commit 705191b03d507744c7e097f78d583621c14988ac upstream.

Last cycle we extended the idmapped mounts infrastructure to support
idmapped mounts of idmapped filesystems (No such filesystem yet exist.).
Since then, the meaning of an idmapped mount is a mount whose idmapping
is different from the filesystems idmapping.

While doing that work we missed to adapt the acl translation helpers.
They still assume that checking for the identity mapping is enough.  But
they need to use the no_idmapping() helper instead.

Note, POSIX ACLs are always translated right at the userspace-kernel
boundary using the caller's current idmapping and the initial idmapping.
The order depends on whether we're coming from or going to userspace.
The filesystem's idmapping doesn't matter at the border.

Consequently, if a non-idmapped mount is passed we need to make sure to
always pass the initial idmapping as the mount's idmapping and not the
filesystem idmapping.  Since it's irrelevant here it would yield invalid
ids and prevent setting acls for filesystems that are mountable in a
userns and support posix acls (tmpfs and fuse).

I verified the regression reported in [1] and verified that this patch
fixes it.  A regression test will be added to xfstests in parallel.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=215849 [1]
Fixes: bd303368b776 ("fs: support mapped mounts of mapped filesystems")
Cc: Seth Forshee <sforshee@digitalocean.com>
Cc: Christoph Hellwig <hch@lst.de>
Cc: <stable@vger.kernel.org> # 5.15+
Cc: <regressions@lists.linux.dev>
Signed-off-by: Christian Brauner (Microsoft) <brauner@kernel.org>
Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
Signed-off-by: Christian Brauner (Microsoft) <brauner@kernel.org>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 fs/posix_acl.c                  |   10 ++++++++++
 fs/xattr.c                      |    6 ++++--
 include/linux/posix_acl_xattr.h |    4 ++++
 3 files changed, 18 insertions(+), 2 deletions(-)

--- a/fs/posix_acl.c
+++ b/fs/posix_acl.c
@@ -760,9 +760,14 @@ static void posix_acl_fix_xattr_userns(
 }
 
 void posix_acl_fix_xattr_from_user(struct user_namespace *mnt_userns,
+				   struct inode *inode,
 				   void *value, size_t size)
 {
 	struct user_namespace *user_ns = current_user_ns();
+
+	/* Leave ids untouched on non-idmapped mounts. */
+	if (no_idmapping(mnt_userns, i_user_ns(inode)))
+		mnt_userns = &init_user_ns;
 	if ((user_ns == &init_user_ns) && (mnt_userns == &init_user_ns))
 		return;
 	posix_acl_fix_xattr_userns(&init_user_ns, user_ns, mnt_userns, value,
@@ -770,9 +775,14 @@ void posix_acl_fix_xattr_from_user(struc
 }
 
 void posix_acl_fix_xattr_to_user(struct user_namespace *mnt_userns,
+				 struct inode *inode,
 				 void *value, size_t size)
 {
 	struct user_namespace *user_ns = current_user_ns();
+
+	/* Leave ids untouched on non-idmapped mounts. */
+	if (no_idmapping(mnt_userns, i_user_ns(inode)))
+		mnt_userns = &init_user_ns;
 	if ((user_ns == &init_user_ns) && (mnt_userns == &init_user_ns))
 		return;
 	posix_acl_fix_xattr_userns(user_ns, &init_user_ns, mnt_userns, value,
--- a/fs/xattr.c
+++ b/fs/xattr.c
@@ -569,7 +569,8 @@ setxattr(struct user_namespace *mnt_user
 		}
 		if ((strcmp(kname, XATTR_NAME_POSIX_ACL_ACCESS) == 0) ||
 		    (strcmp(kname, XATTR_NAME_POSIX_ACL_DEFAULT) == 0))
-			posix_acl_fix_xattr_from_user(mnt_userns, kvalue, size);
+			posix_acl_fix_xattr_from_user(mnt_userns, d_inode(d),
+						      kvalue, size);
 	}
 
 	error = vfs_setxattr(mnt_userns, d, kname, kvalue, size, flags);
@@ -667,7 +668,8 @@ getxattr(struct user_namespace *mnt_user
 	if (error > 0) {
 		if ((strcmp(kname, XATTR_NAME_POSIX_ACL_ACCESS) == 0) ||
 		    (strcmp(kname, XATTR_NAME_POSIX_ACL_DEFAULT) == 0))
-			posix_acl_fix_xattr_to_user(mnt_userns, kvalue, error);
+			posix_acl_fix_xattr_to_user(mnt_userns, d_inode(d),
+						    kvalue, error);
 		if (size && copy_to_user(value, kvalue, error))
 			error = -EFAULT;
 	} else if (error == -ERANGE && size >= XATTR_SIZE_MAX) {
--- a/include/linux/posix_acl_xattr.h
+++ b/include/linux/posix_acl_xattr.h
@@ -34,15 +34,19 @@ posix_acl_xattr_count(size_t size)
 
 #ifdef CONFIG_FS_POSIX_ACL
 void posix_acl_fix_xattr_from_user(struct user_namespace *mnt_userns,
+				   struct inode *inode,
 				   void *value, size_t size);
 void posix_acl_fix_xattr_to_user(struct user_namespace *mnt_userns,
+				   struct inode *inode,
 				 void *value, size_t size);
 #else
 static inline void posix_acl_fix_xattr_from_user(struct user_namespace *mnt_userns,
+						 struct inode *inode,
 						 void *value, size_t size)
 {
 }
 static inline void posix_acl_fix_xattr_to_user(struct user_namespace *mnt_userns,
+					       struct inode *inode,
 					       void *value, size_t size)
 {
 }


Patches currently in stable-queue which might be from brauner@kernel.org are

queue-5.15/fs-account-for-group-membership.patch
queue-5.15/fs-use-low-level-mapping-helpers.patch
queue-5.15/fs-move-mapping-helpers.patch
queue-5.15/fs-remove-unused-low-level-mapping-helpers.patch
queue-5.15/fs-tweak-fsuidgid_has_mapping.patch
queue-5.15/fs-add-i_user_ns-helper.patch
queue-5.15/fs-add-is_idmapped_mnt-helper.patch
queue-5.15/fs-support-mapped-mounts-of-mapped-filesystems.patch
queue-5.15/fs-fix-acl-translation.patch
queue-5.15/fs-port-higher-level-mapping-helpers.patch
queue-5.15/docs-update-mapping-documentation.patch
queue-5.15/fs-account-for-filesystem-mappings.patch
