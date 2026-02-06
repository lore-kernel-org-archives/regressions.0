Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C39625CC6C;
	Fri,  6 Feb 2026 16:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770395575; cv=none; b=XWMCQ3GsmI9EjfcN2otU0otkbigM2Zr4jSiKcPfsmiKy/KnMouv5v/JieH2Qq0bEu4UYTe0oRpJTZxRac6bO7X71B41+JyVjp9oVUEfzzB3+xRIDO1A+yLL9G0ZQore7XWu+QZuetfjJoCeSb2I28W1HjAr+mdVV3jsUp7Qp6Vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770395575; c=relaxed/simple;
	bh=50vC6NDaf/FpXjVp+VpUu5wsgos9TxnADXJwtZm7Yfw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TqxSfN7UO5/5GzCIKgKCodp0XuwP5mVG8GwxArmCPyDbMGpP4RtFjgJa5tlOKmCvhXFA17Hsh/KHC7eL5MgJZ3MS9/jOygmf9EXgXeyj6z/+/ygoYTV3EyF3qqAbHjKSsXqhvdheQOyWx/H54NcRdhu98OPIpqEov1C56k9H93Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WO1D+DNi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WO1D+DNi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82FFCC116C6;
	Fri,  6 Feb 2026 16:32:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770395574;
	bh=50vC6NDaf/FpXjVp+VpUu5wsgos9TxnADXJwtZm7Yfw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WO1D+DNiwPPR9KX2hBUuPCB2MTl6v6TapNLG+/gzgeVgcW2N/lY6aRGarfO0zzxnQ
	 sK66Micr2FgWn4mFtgQ6f0mXD/RcxJEQrxYdlsf5BnU3vyLJ9po7/GzVbdgaVX1n9L
	 Pi4Yp4Ke5Sl7WpgXIzlowo0vFoJ+Yu2qQubEhiADX0o6kRUC4uy+2x0rptLjUW4jFZ
	 kGo/DjLdD8EeiZbXDCmA1Q8oKCsLzeFQoZfOaKlhwRVgGabK4Wk0heQ5jXEsqS15uU
	 7Ozlug+IPbQbmj43I7WVf8xPNYnIbgS1O0UXb5qv3W5ZoWR7wBKxQKWUUAHFI1euGp
	 BreZ6Z8EqHx0w==
Date: Fri, 6 Feb 2026 08:32:51 -0800
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Thomas Gleixner <tglx@glx-um.de>
Cc: Thorsten Leemhuis <regressions@leemhuis.info>, 
	Alexey Makhalov <alexey.makhalov@broadcom.com>, x86@kernel.org, linux-kernel@vger.kernel.org, 
	Ajay Kaher <ajay.kaher@broadcom.com>, bcm-kernel-feedback-list@broadcom.com, 
	Peter Zijlstra <peterz@infradead.org>, Justin Forbes <jforbes@fedoraproject.org>, 
	Linux kernel regressions list <regressions@lists.linux.dev>, Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH] x86/vmware: Fix hypercall clobbers
Message-ID: <uc62gsttzmh5o35uh7viy326bqwpq5gxmcxqqyqb4zp4blp7tg@v3kfsotqtaay>
References: <bed73c01aba29fe651c9e23a9820a21e88ad13e7.1769048488.git.jpoimboe@kernel.org>
 <99a9c69a-fc1a-43b7-8d1e-c42d6493b41f@broadcom.com>
 <73641ce4-9387-48c6-8904-74997f9bb7ac@leemhuis.info>
 <cjacqm5kz67e3nrjfxhpe4lepr27cnbmykdixknta4r2wh7ugq@3wne235ikkb7>
 <eef847de-7ef5-4491-91f2-7437dcb573cb@leemhuis.info>
 <kv4bv3jng2iap3qwvk36pciggiho4yhavnfvsisri67jkdt6kr@szokbl6qdibl>
 <87jywq18yt.ffs@tglx>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87jywq18yt.ffs@tglx>

On Fri, Feb 06, 2026 at 11:07:22AM +0100, Thomas Gleixner wrote:
> So unless there is a compelling argument why the existing hypercall
> implementation is broken by design, the trivial one-line fix from Alexey
> is addressing the actual root cause (it just needs a big fat comment)
> and good enough to cure the regression, no?

While my original patch might be overkill, Alexey's one-line fix doesn't
go far enough:

  1) It only changes one hypercall site, the vmmouse driver has several.
     All of the following commands are subject to register corruption by
     QEMU:

       VMWARE_CMD_ABSPOINTER_DATA
       VMWARE_CMD_ABSPOINTER_STATUS
       VMWARE_CMD_ABSPOINTER_COMMAND
     
  2) While the inline asm for vmware_hypercall7() does have RSI/RDI
     listed as input constraints, it doesn't clobber them.

So a spot fix would need to be something like so:

diff --git a/arch/x86/include/asm/vmware.h b/arch/x86/include/asm/vmware.h
index c9cf43d5ef23..9f72569fc8c2 100644
--- a/arch/x86/include/asm/vmware.h
+++ b/arch/x86/include/asm/vmware.h
@@ -119,6 +119,27 @@ unsigned long vmware_hypercall1(unsigned long cmd, unsigned long in1)
 	return out0;
 }
 
+static inline
+unsigned long vmware_hypercall1_clobber(unsigned long cmd, unsigned long in1)
+{
+	unsigned long out0, tmp = 0;
+
+	if (cpu_feature_enabled(X86_FEATURE_TDX_GUEST))
+		return vmware_tdx_hypercall(cmd, in1, 0, 0, 0,
+					    NULL, NULL, NULL, NULL, NULL);
+
+	if (unlikely(!alternatives_patched) && !__is_defined(MODULE))
+		return vmware_hypercall_slow(cmd, in1, 0, 0, 0,
+					     NULL, NULL, NULL, NULL, NULL);
+
+	asm_inline volatile (VMWARE_HYPERCALL
+		: "=a" (out0), "+b" (in1), "+c" (cmd), "+d" (tmp)
+		: [port] "i" (VMWARE_HYPERVISOR_PORT),
+		  "a" (VMWARE_HYPERVISOR_MAGIC)
+		: "di", "si", "cc", "memory");
+	return out0;
+}
+
 static inline
 unsigned long vmware_hypercall3(unsigned long cmd, unsigned long in1,
 				u32 *out1, u32 *out2)
@@ -144,6 +165,30 @@ unsigned long vmware_hypercall3(unsigned long cmd, unsigned long in1,
 	return out0;
 }
 
+static inline
+unsigned long vmware_hypercall3_clobber(unsigned long cmd, unsigned long in1,
+					u32 *out1, u32 *out2)
+{
+	unsigned long out0, tmp = 0;
+
+	if (cpu_feature_enabled(X86_FEATURE_TDX_GUEST))
+		return vmware_tdx_hypercall(cmd, in1, 0, 0, 0,
+					    out1, out2, NULL, NULL, NULL);
+
+	if (unlikely(!alternatives_patched) && !__is_defined(MODULE))
+		return vmware_hypercall_slow(cmd, in1, 0, 0, 0,
+					     out1, out2, NULL, NULL, NULL);
+
+	asm_inline volatile (VMWARE_HYPERCALL
+		: "=a" (out0), "=b" (*out1), "=c" (*out2), "+d" (tmp)
+		: [port] "i" (VMWARE_HYPERVISOR_PORT),
+		  "a" (VMWARE_HYPERVISOR_MAGIC),
+		  "b" (in1),
+		  "c" (cmd)
+		: "di", "si", "cc", "memory");
+	return out0;
+}
+
 static inline
 unsigned long vmware_hypercall4(unsigned long cmd, unsigned long in1,
 				u32 *out1, u32 *out2, u32 *out3)
@@ -169,6 +214,31 @@ unsigned long vmware_hypercall4(unsigned long cmd, unsigned long in1,
 	return out0;
 }
 
+static inline
+unsigned long vmware_hypercall4_clobber(unsigned long cmd, unsigned long in1,
+					u32 *out1, u32 *out2, u32 *out3)
+{
+	unsigned long out0;
+
+	if (cpu_feature_enabled(X86_FEATURE_TDX_GUEST))
+		return vmware_tdx_hypercall(cmd, in1, 0, 0, 0,
+					    out1, out2, out3, NULL, NULL);
+
+	if (unlikely(!alternatives_patched) && !__is_defined(MODULE))
+		return vmware_hypercall_slow(cmd, in1, 0, 0, 0,
+					     out1, out2, out3, NULL, NULL);
+
+	asm_inline volatile (VMWARE_HYPERCALL
+		: "=a" (out0), "=b" (*out1), "=c" (*out2), "=d" (*out3)
+		: [port] "i" (VMWARE_HYPERVISOR_PORT),
+		  "a" (VMWARE_HYPERVISOR_MAGIC),
+		  "b" (in1),
+		  "c" (cmd),
+		  "d" (0)
+		: "di", "si", "cc", "memory");
+	return out0;
+}
+
 static inline
 unsigned long vmware_hypercall5(unsigned long cmd, unsigned long in1,
 				unsigned long in3, unsigned long in4,
diff --git a/drivers/input/mouse/vmmouse.c b/drivers/input/mouse/vmmouse.c
index fb1d986a6895..0ab04b8bb923 100644
--- a/drivers/input/mouse/vmmouse.c
+++ b/drivers/input/mouse/vmmouse.c
@@ -125,7 +125,7 @@ static psmouse_ret_t vmmouse_report_events(struct psmouse *psmouse)
 
 	while (count--) {
 		/* See if we have motion data. */
-		status = vmware_hypercall1(VMWARE_CMD_ABSPOINTER_STATUS, 0);
+		status = vmware_hypercall1_clobber(VMWARE_CMD_ABSPOINTER_STATUS, 0);
 		if ((status & VMMOUSE_ERROR) == VMMOUSE_ERROR) {
 			psmouse_err(psmouse, "failed to fetch status data\n");
 			/*
@@ -145,8 +145,8 @@ static psmouse_ret_t vmmouse_report_events(struct psmouse *psmouse)
 		}
 
 		/* Now get it */
-		status = vmware_hypercall4(VMWARE_CMD_ABSPOINTER_DATA, 4,
-					   &x, &y, &z);
+		status = vmware_hypercall4_clobber(VMWARE_CMD_ABSPOINTER_DATA, 4,
+						   &x, &y, &z);
 
 		/*
 		 * And report what we've got. Prefer to report button
@@ -222,9 +222,9 @@ static void vmmouse_disable(struct psmouse *psmouse)
 {
 	u32 status;
 
-	vmware_hypercall1(VMWARE_CMD_ABSPOINTER_COMMAND, VMMOUSE_CMD_DISABLE);
+	vmware_hypercall1_clobber(VMWARE_CMD_ABSPOINTER_COMMAND, VMMOUSE_CMD_DISABLE);
 
-	status = vmware_hypercall1(VMWARE_CMD_ABSPOINTER_STATUS, 0);
+	status = vmware_hypercall1_clobber(VMWARE_CMD_ABSPOINTER_STATUS, 0);
 	if ((status & VMMOUSE_ERROR) != VMMOUSE_ERROR)
 		psmouse_warn(psmouse, "failed to disable vmmouse device\n");
 }
@@ -246,19 +246,19 @@ static int vmmouse_enable(struct psmouse *psmouse)
 	 * Try enabling the device. If successful, we should be able to
 	 * read valid version ID back from it.
 	 */
-	vmware_hypercall1(VMWARE_CMD_ABSPOINTER_COMMAND, VMMOUSE_CMD_ENABLE);
+	vmware_hypercall1_clobber(VMWARE_CMD_ABSPOINTER_COMMAND, VMMOUSE_CMD_ENABLE);
 
 	/*
 	 * See if version ID can be retrieved.
 	 */
-	status = vmware_hypercall1(VMWARE_CMD_ABSPOINTER_STATUS, 0);
+	status = vmware_hypercall1_clobber(VMWARE_CMD_ABSPOINTER_STATUS, 0);
 	if ((status & 0x0000ffff) == 0) {
 		psmouse_dbg(psmouse, "empty flags - assuming no device\n");
 		return -ENXIO;
 	}
 
-	version = vmware_hypercall1(VMWARE_CMD_ABSPOINTER_DATA,
-				    1 /* single item */);
+	version = vmware_hypercall1_clobber(VMWARE_CMD_ABSPOINTER_DATA,
+					    1 /* single item */);
 	if (version != VMMOUSE_VERSION_ID) {
 		psmouse_dbg(psmouse, "Unexpected version value: %u vs %u\n",
 			    (unsigned) version, VMMOUSE_VERSION_ID);
@@ -269,11 +269,10 @@ static int vmmouse_enable(struct psmouse *psmouse)
 	/*
 	 * Restrict ioport access, if possible.
 	 */
-	vmware_hypercall1(VMWARE_CMD_ABSPOINTER_RESTRICT,
-			  VMMOUSE_RESTRICT_CPL0);
+	vmware_hypercall1(VMWARE_CMD_ABSPOINTER_RESTRICT, VMMOUSE_RESTRICT_CPL0);
 
-	vmware_hypercall1(VMWARE_CMD_ABSPOINTER_COMMAND,
-			  VMMOUSE_CMD_REQUEST_ABSOLUTE);
+	vmware_hypercall1_clobber(VMWARE_CMD_ABSPOINTER_COMMAND,
+				  VMMOUSE_CMD_REQUEST_ABSOLUTE);
 
 	return 0;
 }
@@ -320,7 +319,7 @@ int vmmouse_detect(struct psmouse *psmouse, bool set_properties)
 
 	/* Check if the device is present */
 	response = ~VMWARE_HYPERVISOR_MAGIC;
-	version = vmware_hypercall3(VMWARE_CMD_GETVERSION, 0, &response, &type);
+	version = vmware_hypercall3_clobber(VMWARE_CMD_GETVERSION, 0, &response, &type);
 	if (response != VMWARE_HYPERVISOR_MAGIC || version == 0xffffffffU)
 		return -ENXIO;
 
