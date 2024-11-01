Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A6A81CDA0F
	for <regressions@lists.linux.dev>; Fri,  1 Nov 2024 17:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730483345; cv=none; b=XaGt+wKIFLTZTX+Us0ZlGB4oq9wPXktydJFn0LgVqVnHmscpsFUs1UbUhOiX53udZHSfNi3sn7EQT2wwqmJdTOcAxLrAytMDuPJc7WsCiMX0atmvncO/bwUJ5o1WjiSyE3acWXK7BKKg1NoCaRnF8UB0IuSYYetfXtt1+PhYpqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730483345; c=relaxed/simple;
	bh=MNq1vw75irUPKm3uNfACSw7+CS/AqwPLJNAX26gOUdA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=IdSnpKbyVZ2IoiCBbq68YlbFoHGxQyC6RE/FY23aAFn5kPX5wzl94r+KLpxpZ1T0+dPNy+MX1rhyMUMEwwjQcj5BfyZ48p0Mum983VATWkv2L4zZxQ0dJJP8ASzrIt65lqlJb58P+6wxN3UKKZrDUSHvmasOOO2ubXKLuVHlBWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=yOLqh/6s; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="yOLqh/6s"
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-6e3c638cc27so45306617b3.0
        for <regressions@lists.linux.dev>; Fri, 01 Nov 2024 10:49:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730483342; x=1731088142; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=gHgmf8yOjF5FUpV4FRVUFTRzyvX9RwDhNCCPw1xBMs4=;
        b=yOLqh/6sGhn7xq7IAo/AiP1WnClEynj7ccTXb0sa/4SxM2eJsw6Z12gKqOGYI5Hi7e
         Ak1wqbdTCBeWt0H1rhb+AkBAmvEgJMi8RYGdwH/oSKsnDvjL6It49DTJj/Kn0jZbPQNo
         tEIGg5xdzAhhamcaFSluQQPQI9TyBFiElsY7m6iGVtxF4mTloCZn+nnV4hDGMjtSjXrE
         OTUYZ3x6Tyj73SjGWr1TKhnmbdFza/eya+XrwahRijtjQPzoMplPLbpX+OrZjAHEm9PD
         EvKtl4K63aEPeUmRewywOftRz8r3ZuQT0xb0p1m6VIdJRM2DtAU2/pBimV6xZ+jWVEkE
         1T5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730483342; x=1731088142;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gHgmf8yOjF5FUpV4FRVUFTRzyvX9RwDhNCCPw1xBMs4=;
        b=QJQWtoMjAn+3AxiWpcUlGknCfEk0UlIBgAATw1jrZDHybcO5iYVY8xnAO78kMz1OhW
         crkErnF2VYgSPyjO3AWxvN7eaj2+BaxwxUfJIgw1H0l+XuFP3KeZOR2DjGYfaci+bqFx
         bSph5613F2OkNeaL4wq+NgfIk4tFQcZ4U8Qd6pdkYlAmeK+f84im7mQqTO9COpI37SXZ
         ivOUGEVHyQ6IJ/5uwOyeECOzzWE7vgnS9LGkMuJTZLKQRVeTkeAPlFO4RbCl/pw8b6aS
         jb6pv+9x9kWhk5GzOZOC/tATdNuwoymhP5DY1GLMDzuLCArc2A3uyKY3OMCaZp7aBZ6S
         jUwA==
X-Forwarded-Encrypted: i=1; AJvYcCWgpvCTaP4m5gI5YJ3xkN/7se47gfrfZT5cIS7UaO9LJ0S4NSvDtVnlo0B0ZTW+LnXV8a9RfZt65+7HZw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy+hBbFxxHd92V3wbvltS1MbN3x0haWOqegEps53tI/jk8WXXlf
	LvuG/e/ISohlre7PDydnlMLsiHuSVmMva9JcW2F+i6hY90+YztE1/FF00YusKJUTYktWitrHOWj
	AeiO005FFClooxw==
X-Google-Smtp-Source: AGHT+IFWPK+8jTuj/8ARDH3sf8FN30h0/V8rLUflMtASKVnWhKOAN7Kh3zxgZ8xlx5S/14HS0km2yhZx9K25O6M=
X-Received: from aliceryhl.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:35bd])
 (user=aliceryhl job=sendgmr) by 2002:a05:690c:11:b0:6ea:6872:2fe6 with SMTP
 id 00721157ae682-6ea68723031mr394537b3.4.1730483342526; Fri, 01 Nov 2024
 10:49:02 -0700 (PDT)
Date: Fri,  1 Nov 2024 17:48:55 +0000
In-Reply-To: <CAH5fLgi+JJHCA_XTPC0-kaacZC6=aGSa-+DiNt06GSJNFhKc3w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <CAH5fLgi+JJHCA_XTPC0-kaacZC6=aGSa-+DiNt06GSJNFhKc3w@mail.gmail.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=6173; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=MNq1vw75irUPKm3uNfACSw7+CS/AqwPLJNAX26gOUdA=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBnJRPMV3tqElTC1f/7fwxC0jgj8Zy8AsmPI1zej
 DVXmJgV0CGJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZyUTzAAKCRAEWL7uWMY5
 Rpo8EACsKxwatzXsgHlXD2b0a7MaqQ6ns6T6StjlDf6f63OfgZZnw4tUY4YNg6ElS2XrbNKeAJ1
 sioGi2vpjVjqCo//I15Z8xocXpodOWyVM9bYCEpDpBpwPJdLJ1JOSdNhb828HNveMyaqw+Mf423
 ldmO1IZukag99HulYyHtHubkrPhg0hXRjNayCmjc2VYQEC/4IgnoA9RCA/hYz7upEZIZ1ABxOhu
 9cLFZdcp9rn1xi4P3OZGIiuu/KZQCSujQgFjt8JQKdHecRgadg4pQJM2BzzEQLtiP9jPdxYCxgn
 9/a3pbVATU/60V+ydh+KfywrADoidyA6oYG0+kyEvNmhd8QSMe9NBMy6H5cExAhdjP9Vzqf4r0H
 9b8hY20KG1Ip2+Ijgm6af/aEdFeHe5fqpJjNzJWrkdsfh5vv2d/yAF49I9n8YDasP6SM4X+YaOq
 lveI93/OeXCmqdWVybDnU5eiaYkD/MY19lWZI7Ny+8p1lkxnO/0TxDKEhsrqnFukQ7Hw36B4iQN
 sr0nXxARPd9XY9YXrD5a2lOvhoJ5FPcyQz4k+Gz3BxKvsveqXi78s9H2JlVhJ86M8JwH7yPE9g4
 OhuW6ZRUmFOWv6aP91wtE1BsUrrizIulcINpeQmN+mjRw0UNxCJcQWHgVCuP985UuKCKfvfJiIb zBBSv8zpG3oqvEg==
X-Mailer: git-send-email 2.47.0.163.g1226f6d8fa-goog
Message-ID: <20241101-lsm-secctx-v1@google.com>
Subject: [PATCH] rust: security: add abstraction for secctx
From: Alice Ryhl <aliceryhl@google.com>
To: paul@paul-moore.com, ojeda@kernel.org, brauner@kernel.org
Cc: anders.roxell@linaro.org, arnd@arndb.de, dan.carpenter@linaro.org, 
	kees@kernel.org, naresh.kamboju@linaro.org, casey@schaufler-ca.com, 
	linux-kernel@vger.kernel.org, lkft-triage@lists.linaro.org, 
	regressions@lists.linux.dev, rust-for-linux@vger.kernel.org, 
	linux-security-module@vger.kernel.org, lkft@linaro.org, 
	benno.lossin@proton.me, yakoyoku@gmail.com, tmgross@umich.edu, 
	gary@garyguo.net, aliceryhl@google.com
Content-Type: text/plain; charset="UTF-8"

Add an abstraction for viewing the string representation of a security
context.

This is needed by Rust Binder because it has a feature where a process
can view the string representation of the security context for incoming
transactions. The process can use that to authenticate incoming
transactions, and since the feature is provided by the kernel, the
process can trust that the security context is legitimate.

This abstraction makes the following assumptions about the C side:
* When a call to `security_secid_to_secctx` is successful, it returns an
  lsm context containing a pointer and length. The pointer references a
  byte string and is valid for reading for that many bytes.
* The string may be referenced until `security_release_secctx` is
  called.
* If CONFIG_SECURITY is set, then the three methods mentioned in
  rust/helpers are available without a helper. (That is, they are not a
  #define or `static inline`.)

This patch had to be modified after its first landing due to some
conflicts with other changes. Please see [1] for details.

Reviewed-by: Benno Lossin <benno.lossin@proton.me>
Reviewed-by: Martin Rodriguez Reboredo <yakoyoku@gmail.com>
Reviewed-by: Trevor Gross <tmgross@umich.edu>
Reviewed-by: Gary Guo <gary@garyguo.net>
Reviewed-by: Kees Cook <kees@kernel.org>
Link: https://lore.kernel.org/r/20241101095620.2526421-1-aliceryhl@google.com [1]
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/bindings/bindings_helper.h |  1 +
 rust/helpers/helpers.c          |  1 +
 rust/helpers/security.c         | 15 +++++++
 rust/kernel/lib.rs              |  1 +
 rust/kernel/security.rs         | 70 +++++++++++++++++++++++++++++++++
 5 files changed, 88 insertions(+)
 create mode 100644 rust/helpers/security.c
 create mode 100644 rust/kernel/security.rs

diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index ae82e9c941af..3f3c39f9a83b 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -18,6 +18,7 @@
 #include <linux/phy.h>
 #include <linux/refcount.h>
 #include <linux/sched.h>
+#include <linux/security.h>
 #include <linux/slab.h>
 #include <linux/wait.h>
 #include <linux/workqueue.h>
diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
index 30f40149f3a9..36a0c833e7b4 100644
--- a/rust/helpers/helpers.c
+++ b/rust/helpers/helpers.c
@@ -17,6 +17,7 @@
 #include "page.c"
 #include "rbtree.c"
 #include "refcount.c"
+#include "security.c"
 #include "signal.c"
 #include "slab.c"
 #include "spinlock.c"
diff --git a/rust/helpers/security.c b/rust/helpers/security.c
new file mode 100644
index 000000000000..f6deb0b28b48
--- /dev/null
+++ b/rust/helpers/security.c
@@ -0,0 +1,15 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/security.h>
+
+#ifndef CONFIG_SECURITY
+int rust_helper_security_secid_to_secctx(u32 secid, struct lsm_context *cp)
+{
+	return security_secid_to_secctx(secid, cp);
+}
+
+void rust_helper_security_release_secctx(struct lsm_context *cp)
+{
+	security_release_secctx(cp);
+}
+#endif
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index 22a3bfa5a9e9..a71dc73a0d9d 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -46,6 +46,7 @@
 pub mod print;
 pub mod sizes;
 pub mod rbtree;
+pub mod security;
 mod static_assert;
 #[doc(hidden)]
 pub mod std_vendor;
diff --git a/rust/kernel/security.rs b/rust/kernel/security.rs
new file mode 100644
index 000000000000..25d2b1ac3833
--- /dev/null
+++ b/rust/kernel/security.rs
@@ -0,0 +1,70 @@
+// SPDX-License-Identifier: GPL-2.0
+
+// Copyright (C) 2024 Google LLC.
+
+//! Linux Security Modules (LSM).
+//!
+//! C header: [`include/linux/security.h`](srctree/include/linux/security.h).
+
+use crate::{
+    bindings,
+    error::{to_result, Result},
+};
+
+/// A security context string.
+///
+/// # Invariants
+///
+/// The `ctx` field corresponds to a valid security context as returned by a successful call to
+/// `security_secid_to_secctx`, that has not yet been destroyed by `security_release_secctx`.
+pub struct SecurityCtx {
+    ctx: bindings::lsm_context,
+}
+
+impl SecurityCtx {
+    /// Get the security context given its id.
+    pub fn from_secid(secid: u32) -> Result<Self> {
+        // SAFETY: `struct lsm_context` can be initialized to all zeros.
+        let mut ctx: bindings::lsm_context = unsafe { core::mem::zeroed() };
+
+        // SAFETY: Just a C FFI call. The pointer is valid for writes.
+        to_result(unsafe { bindings::security_secid_to_secctx(secid, &mut ctx) })?;
+
+        // INVARIANT: If the above call did not fail, then we have a valid security context.
+        Ok(Self { ctx })
+    }
+
+    /// Returns whether the security context is empty.
+    pub fn is_empty(&self) -> bool {
+        self.ctx.len == 0
+    }
+
+    /// Returns the length of this security context.
+    pub fn len(&self) -> usize {
+        self.ctx.len as usize
+    }
+
+    /// Returns the bytes for this security context.
+    pub fn as_bytes(&self) -> &[u8] {
+        let ptr = self.ctx.context;
+        if ptr.is_null() {
+            debug_assert_eq!(self.len(), 0);
+            // We can't pass a null pointer to `slice::from_raw_parts` even if the length is zero.
+            return &[];
+        }
+
+        // SAFETY: The call to `security_secid_to_secctx` guarantees that the pointer is valid for
+        // `self.len()` bytes. Furthermore, if the length is zero, then we have ensured that the
+        // pointer is not null.
+        unsafe { core::slice::from_raw_parts(ptr.cast(), self.len()) }
+    }
+}
+
+impl Drop for SecurityCtx {
+    fn drop(&mut self) {
+        // SAFETY: By the invariant of `Self`, this frees a context that came from a successful
+        // call to `security_secid_to_secctx` and has not yet been destroyed by
+        // `security_release_secctx`.
+        unsafe { bindings::security_release_secctx(&mut self.ctx) };
+    }
+}

base-commit: 1008010aafe7b1e06974b8b1bf29b052fcf87f92
-- 
2.47.0.199.ga7371fff76-goog

