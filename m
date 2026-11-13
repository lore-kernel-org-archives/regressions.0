Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794564208;
	b=flG2tWM+jM+rX2P4o881Wj16Z3l6OEWr/LrqB00xsPuPlNOCJsGEVAp+uCh/UAslnLJw
	 lDWYOKlxRR3KAkk3I/txE899sYDsPJGmWBpQKe+e0pTTQki8Z0AFhrzSYEUCtjU0CK+hF
	 gl4UOoqaxpuTIqHphzkpKW9LKudidjvMiauhrztjVqHXZrKQo66HeFCH4OqR1WQwfBPg+
	 JHO0q5XLhU8ijU/Ji/sqw/15d8U7RLy154W3YeZ+qr269uOQTmg3AKfYLN8aK/g+s6ygy
	 8f6qoFisspfulAz6aAZJaHXBuzi+ry0fjVCUR2jZVoPaKrJdKywdkqGjwXjC1vcLuEg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794564208;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=f3rKnzeXmPTjVNP6fPu4kFAyMWVVj9CVo0hSntZlMr0=;
	b=h4CENxcwyunewTYstShYf1vLcgknVW+H3auY5jwwPq1VWpj3NxzAHdou/DhJ9pvlS/pg
	 Yx1H2fkN8kyJ5oeklatTZebUq1DZH1NhPse9z61E9ItQ1rcgcTB8W0CZq1VrYfGAH1/qs
	 XyvD2FS+z5iH/6KWfnecKj8s0XxDkMu2gL/7cUhelmekP5FhyAXUFBSbMxDK0FK75CnxX
	 7N5Wzo2FMl1vvke2Mk3jMvh1cctogv16k2vCgeQ6Tfg/BViVVh9yFvXv+H/FnxGsyxefQ
	 DtUW06z+9jSAblfHv9Q0s9c6uPPSpdvC6pY4VcmcntPTvxiUe8CzNXV58yfrIj2ZbZQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zEVcHLtr;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.45
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 646CC60A3838
	for <regressions@lists.linux.dev>; Fri, 13 Nov 2026 10:03:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 646CC60A3838
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zEVcHLtr
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-91eb3fea2a9so13569896d6.3
        for <regressions@lists.linux.dev>; Fri, 13 Nov 2026 02:03:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794564207; cv=none;
        d=google.com; s=arc-20260327;
        b=skr1TSmEG79xYCuZBhZmslA8/VyjHn43vgL4kR12NE2c69kvB0sHQ4Z4tPydd8Tk2r
         ayf4Vbf/QqSuGYhoX1KE2PT6kdIkK2hHpFV1EiS/jAzUj+lk3Ek7FLACkvWA0o2mI8LU
         BljPxgJfBKtftLbLxmCW3DDs3zpqNmkrEVxOiKRdW2XIRBPqzT9yaKpDQ9oqS5tnJB1n
         d+ei2jnOQlMdkIpCW8Et3/znM4dFMxYDPRORCXbuvEWKEMXgmmWS+X942/yktdz9y5g1
         +eHtrEBsET3ba8QmANOpfDNPuFXuDgMQX7BLpWU+tcD4mIM6tLMn99WsnhiIMcvOGp0T
         TVaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=f3rKnzeXmPTjVNP6fPu4kFAyMWVVj9CVo0hSntZlMr0=;
        fh=5HSqRHrNYtD07jBsqQf+m2AuUqWO92lNWkjRka+TvQ0=;
        b=WKQnVvpHQ3aDbQEnm/keEscUyCG2SW4RHUgg4jGtkcTFoujFi00rlv+tJjwLIf/N0B
         GPFKUFD73Og/q8K1hcsusTwdyTu+fbvW8vbpEdUMyCTMmbaPjWFmbj21a9veCDYN0oSE
         jkvuWzh0JibgF0SnRLSRhGnumSP1el7pjv8BcZjpC0N3w1KGuNbcGOVoAtUym6ed2peQ
         Xo3kxXNZcyTQ6K2ggENkl9/6BwcWc1nQcg2iOsuIJeU4qg7XqE7e9B25Z+ItDC/k08rj
         CbqG2L0xhIOZNuPVv5EAcupj86tfxg9qZ+IfqEiFW1UTJNaOfAY99LxSl6UQdOsP9iFo
         ZHnw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794564207; x=1795169007; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=f3rKnzeXmPTjVNP6fPu4kFAyMWVVj9CVo0hSntZlMr0=;
        b=zEVcHLtrzMPFtapk9uF6040PJCBXO9FfyYNvmTDH2vz5V7cQq9IRoPsAkibbZja44W
         gvI6FkJdWsgEnp/cAAZPZbv1vPZIzZYBmEoNSzc/JE8rM2UKtX2fZw0ogN+AfaBJyjJy
         EwJsMwbnWEBrmxfp2bNVIh+quEWuA3wzxJSDpVaXNgxlTiQjWJ8ccsYNH09Z0RlOE7CB
         abGIPNaChlhGJAuk8Q2OnbGnkYlRlaoAreQDJVSRBEOybjzVRMjpEo4663+71FOEQKc0
         ZAQtXytq7ezI0YIjwymbLrqhk/JNxDSb0wQClIYDB1SBFDi4cN4lqqNpBvvibSBqnhD0
         XfAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794564207; x=1795169007;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=f3rKnzeXmPTjVNP6fPu4kFAyMWVVj9CVo0hSntZlMr0=;
        b=tYsi1UQ2NQOkzBPwHX2UY3JZ6iPDkZebCxLMJXN5cLQhX2Tr6MzTPau03HDCU2+zuT
         Ss+Yd54B8I/kUtwy2yO24ULVyARXsCjcPPxhRdzugDN2uf+A/KxGbFJviduu45zZkF5q
         9PAF31oK5xbaWXYB3XNwHJVl0LZwMT2t28JzULBsLu3A26qcmBqwkIUCL1Bqmj18IESs
         yeoovh4JZXyyIPuF88M1k+ghf+Y/h2hTtm0evT89rz+NMDaHSrMipFvsm0q/rL0IUaB4
         UvRexFrK7MaED6JW99z3862POwYg58dJY7z/PAldX5uGMTy6+MSSCrWR51EE0JDZfkbh
         k+pQ==
X-Forwarded-Encrypted: i=1; AL+hErHl6HOmglE5hNG/4gt3DMcOuHQzq5Fm9nasrLzWzeFkPQnEaNUNNftin47ua7GZXGGPkZXx/YbSpPWiRQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z/1pwQfPPVJjGI1sqm/ZdRLEkvUbTDCx5VlOVtmCs6fyt9SJi+q
	Xdm71WtvWnt22dSc6IiRVCO2rPcwHdzlaXt9ck06gj32Bff7Nz7d9zydEe8/RNX8KKrdbQlIHFO
	Pc/H+KiqEJPuwbT49goMzuaFXREDckFY=
X-Gm-Gg: AYBFou3eE2f+5OaDBi+w8kl0ZZVOyelEuYyeARiVirMT316W1Kg/mofdz2OvtBVNrdg
	74LR6+RN4v9UQ3obSJYKZAqm0haWexwrpoB4qtQShAdtT7nIRj6LxCTrwjuEUrKXENfTj07E29i
	QIlVsXHrWnTipl0z3v/DC0x0cS+pYTuSGWhm2Nw9+49lno2LkyVHddcBbBdJ60sry1onZ/nqR13
	59ANMu+q+hj+11rRqgLlOcErv4nbIpKnXBKVgi15zcEpLOj2BbrvLGRfH2kw3qqnv31n0DnLICy
	XppIY6BYIJhCaKKT1+K0tO65lIsgMZS85PS40WW0L/+CEGchqfErqcebmWbPRgjbBVHjcE0b362
	TtiKdGfaTAIZhyR+/KtzlrRYYbrvX2P3ZlKjc
X-Received: by 2002:a05:622a:5446:b0:535:70b4:3f86 with SMTP id
 d75a77b69052e-55ac9e59bb4mr29783671cf.76.1794564207053; Fri, 13 Nov 2026
 02:03:27 -0800 (PST)
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
From: Hristos Nenkov <nenkov2004@gmail.com>
Date: Fri, 13 Nov 2026 11:03:15 +0100
X-Gm-Features: AclHuK_9m7WQNlxFW7kCm3i_5qb6-LzCoS-_xPEfDmcl2bQBqfwAi34Sqeb7WTY
Message-ID: <CAO7_G+ypR12OwOiwnrqXDAC9zoboTMn_qLoASfJqYP3H83Vk5A@mail.gmail.com>
Subject: [RFC PATCH] fuse: preserve daemon-owned ACL permission decisions
To: Christian Brauner <brauner@kernel.org>, Miklos Szeredi <miklos@szeredi.hu>, 
	Alexander Viro <viro@zeniv.linux.org.uk>
Cc: Jan Kara <jack@suse.cz>, Seth Forshee <sforshee@kernel.org>, 
	Lakshita Jain <lakshita.jain@databricks.com>, linux-fsdevel@vger.kernel.org, 
	fuse-devel@lists.linux.dev, regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Legacy FUSE daemons without default_permissions or FUSE_POSIX_ACL can
make their own permission decisions. Generic ACL ownership checking
prevents non-owner ACL writes and removals reaching these daemons,
including operations associated with sed -i and install -m.

Introduce an opt-in inode-operation flag so FUSE can make the ownership
decision in its ACL callback. Retain owner/capability checking for
default_permissions and negotiated POSIX ACL mode, and leave the generic
ownership check in place for filesystems that do not opt in.

Enforce the FUSE mount caller restriction and wait for channel readiness
before reading negotiated policy, including requests on the mount root.
The wait follows existing request-allocation publication, interruption,
freezer and abort-accounting conventions.

Fixes: 318e66856dde ("xattr: use posix acl api")
Link: https://lore.kernel.org/all/CALE1rk6tGt_Pe7CpFL1NSTgugVpXLH_iguO2D9VsAVHn1p-02w@mail.gmail.com/

Signed-off-by: Hristos Nenkov <nenkov2004@gmail.com>
---
Hi Christian, Miklos, Al, Jan and Lakshita,

I reproduced Lakshita's report with libfuse 3.14.0 on WSL 6.18.58.1,
including both setting and removing an access ACL, and prepared this
candidate for design review.

I built baseline and candidate kernels from
f66469d9905b39d2c260a15d7d6db450f4db67c1 (7.4-rc1) with a minimal x86_64
configuration and booted both under QEMU TCG. The expanded matrix
completed 100 baseline assertions and 101 candidate assertions with
zero mismatches. The baseline confirms the expected original EPERM;
the candidate forwards legacy non-owner requests to the daemon while
retaining the tested kernel-managed restrictions.

The matrix covers access/default ACL set and removal, owner/non-owner
callers, default_permissions, negotiated FUSE_POSIX_ACL, daemon rejection,
malformed ACLs, read-only mounts, root requests without allow_other,
and a root ACL request observed pending before daemon initialization.
That observation identifies the syscall, not the exact kernel wait site.

Checkpatch completed with 0 errors, 0 warnings and 0 checks. A final
two-line indentation adjustment produced a byte-identical dev.o; the
packet's source, guest and image hashes were checked against the build
and VM receipts.

The test daemon acknowledges operations without storing ACLs, so this
does not establish ACL persistence or candidate passthrough sed/install
behavior. Newer upstream, namespace/idmap, LSM and wider other-filesystem
testing remain outstanding. I can provide the VM harness and serial
logs if useful.

I used OpenAI Codex to trace the supplied report and draft the changes,
VM harness and message. I ran the Linux builds and VM tests locally.
A separate-context AI review identified initialization and caller-policy
gaps in the first local proposal; this candidate includes corrections
and the additional boundary controls. No human Reviewed-by or
maintainer approval is claimed.

Would this opt-in flag be an acceptable way to express the ownership
policy, or would you prefer a different VFS interface? In particular,
the placement of the ownership decision relative to generic ACL
validation, and the readiness helper, need review. This is an RFC,
not a request for immediate merge.

Thank you for your time.

Best regards,
Hristos Nenkov

diff --git a/include/linux/fs.h b/include/linux/fs.h
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -627,6 +627,8 @@
 #define IOP_CACHED_LINK                0x0040
 #define IOP_FASTPERM_MAY_EXEC  0x0080
 #define IOP_FLCTX              0x0100
+/* ->set_acl() is responsible for the ownership check. */
+#define IOP_ACL_OWNER_CHECK    0x0200

 /*
  * Inode state bits.  Protected by inode->i_lock
diff --git a/fs/posix_acl.c b/fs/posix_acl.c
--- a/fs/posix_acl.c
+++ b/fs/posix_acl.c
@@ -949,7 +949,8 @@

        if (type == ACL_TYPE_DEFAULT && !S_ISDIR(inode->i_mode))
                return acl ? -EACCES : 0;
-       if (!inode_owner_or_capable(idmap, inode))
+       if (!(inode->i_opflags & IOP_ACL_OWNER_CHECK) &&
+           !inode_owner_or_capable(idmap, inode))
                return -EPERM;

        if (acl) {
diff --git a/fs/fuse/inode.c b/fs/fuse/inode.c
--- a/fs/fuse/inode.c
+++ b/fs/fuse/inode.c
@@ -433,6 +433,8 @@
                                   new_decode_dev(attr->rdev));
        } else
                BUG();
+       /* ACL ownership policy depends on the negotiated connection mode. */
+       inode->i_opflags |= IOP_ACL_OWNER_CHECK;
        /*
         * Ensure that we don't cache acls for daemons without FUSE_POSIX_ACL
         * so they see the exact same behavior as before.
diff --git a/fs/fuse/acl.c b/fs/fuse/acl.c
--- a/fs/fuse/acl.c
+++ b/fs/fuse/acl.c
@@ -5,6 +5,7 @@
  */

 #include "fuse_i.h"
+#include "dev.h"

 #include <linux/posix_acl.h>
 #include <linux/posix_acl_xattr.h>
@@ -101,6 +102,20 @@
        if (fuse_is_bad(inode))
                return -EIO;

+       if (!fuse_allow_current_process(fc))
+               return -EACCES;
+
+       ret = fuse_chan_wait_ready(fc->chan);
+       if (ret)
+               return ret;
+       if (fc->conn_error)
+               return -ECONNREFUSED;
+
+       /* Legacy daemons without default_permissions decide ownership. */
+       if ((fc->default_permissions || fc->posix_acl) &&
+           !inode_owner_or_capable(idmap, inode))
+               return -EPERM;
+
        if (fc->no_setxattr || fuse_no_acl(fc, inode))
                return -EOPNOTSUPP;

diff --git a/fs/fuse/dev.c b/fs/fuse/dev.c
--- a/fs/fuse/dev.c
+++ b/fs/fuse/dev.c
@@ -107,6 +107,25 @@
                /* wake up aborters */
                wake_up_all(&fch->blocked_waitq);
        }
+}
+
+/* Wait for channel negotiation before using connection-dependent policy. */
+int fuse_chan_wait_ready(struct fuse_chan *fch)
+{
+       int err = 0;
+
+       atomic_inc(&fch->num_waiting);
+       if (fuse_block_alloc(fch, false)) {
+               err = -EINTR;
+               if (wait_event_state_exclusive(fch->blocked_waitq,
+                                              !fuse_block_alloc(fch, false),
+                                              (TASK_KILLABLE |
TASK_FREEZABLE)))
+                       goto out;
+       }
+       err = READ_ONCE(fch->connected) ? 0 : -ENOTCONN;
+out:
+       fuse_drop_waiting(fch);
+       return err;
 }

 static void fuse_put_request(struct fuse_req *req);
diff --git a/fs/fuse/dev.h b/fs/fuse/dev.h
--- a/fs/fuse/dev.h
+++ b/fs/fuse/dev.h
@@ -36,6 +36,7 @@
 unsigned int fuse_chan_num_waiting(struct fuse_chan *fch);
 void fuse_chan_set_fc(struct fuse_chan *fch, struct fuse_conn *fc);
 void fuse_chan_set_initialized(struct fuse_chan *fch, struct
fuse_chan_param *param);
+int fuse_chan_wait_ready(struct fuse_chan *fch);
 ssize_t fuse_chan_send(struct fuse_chan *fch, struct fuse_args *args);
 int fuse_chan_send_bg(struct fuse_chan *fch, struct fuse_args *args,
gfp_t gfp_flags);
 int fuse_chan_send_notify_reply(struct fuse_chan *fch, struct
fuse_args *args, u64 unique);
