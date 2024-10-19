Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DE05632
	for <regressions@lists.linux.dev>; Sat, 19 Oct 2024 23:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729380130; cv=none; b=EBvPFoxQq5a4VqUW6IrCi13kmpPQ5yVnkgtnc4s5iWKVuCW24lEtHtYoBSs2XwgNPa+ELpzWS6TUE7USgQeZa6wwZ2J2Lm6QDbRfDfZJzdSiUmxLp7wmtazlFghy0erQGZZCej+3oB8Zoy7NKEROIHWsYq9i4TOq0b/6wnxsZ9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729380130; c=relaxed/simple;
	bh=OUxukFYgOL8m0LMweFeeARsqPdOquEZEHJcb7qVbtkg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kG4/vMC0QPAJT7vDwuBdEPP20FTma4N2rtd9j9nfQGzwJM5d2PuAAbMnSb6Yrb6qT3f8s7lE0ud7juwCt4NfIyaYzTmk78gGxRjWI6DVvXk0nTHbjRqJAqVqDYO+hKUPXVoj20/lsJIAfh/MCz4TcJbjEF3h9lfS/H3tIJ6n5fI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=EUOkGOhB; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="EUOkGOhB"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 1512840E0263;
	Sat, 19 Oct 2024 23:22:00 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id Mh64A8HInME8; Sat, 19 Oct 2024 23:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1729380115; bh=oCSbyPF/R/1xX62E/4cFGS8OZsy6+A8VmtaNRQijbR8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EUOkGOhBiG9jFwxrLwzbGIGQiZcjgtJef8qTMj2XhvApwd5EMDypUVr1Hnd2t+i6q
	 lqXT7hEmAYYfvV1jsPwOxEkF/hgazHhMNtFJPpNmjZrQbPX+0FGTkS5FhQzwrJwLc9
	 jIMe3h7d0eRaEFDaV2sRKZqLMqJhUODVcpWzRtCoulC6khGn6vCwRiglRrzqaBhHUM
	 IboyLEER44faWwTHEBhjtg6dVh0RTzG0kNHjyBaO4PxeShQ1xUYYZj5nIHSZ6sJ1bP
	 648/Suhcb6FQA7hr8MKhB3h72+gmQGNXbwxrRdEE05Dio7VoNUSKRFml2XMW/TBKyt
	 2YqdTQXN89Ba7HYaTjEhg/vilVFtW2ChrvrvV0m4vA19CsHCWWynoAhQqZvNLrfYPH
	 L4ofAKRSijBTrSCZnezqsDKOYBMBU3mO0XYeEyrlXl68/fWzfnEY5I8qhWzTY7djCr
	 ro26Qwt+BMW11pEG9o6lUFeN7HeMG/M4YBW29uCnPUxv9ORY9d+tw3CPYhVLXt1/mF
	 FHG5ve9nayrAuOM3Eg4lcizHWoO1WQSlPypjp29i8q5GMs17FAjwlefYZ/4Bj6Ve2R
	 T6D0mBFBSvdScrw6de/BeJHqi9YKsLpNzlgQFr/zpsSsJQrJs6w3Dj+JiM5cbtY8bk
	 bavvmQDoJ6zZibJxCDDJUJEc=
Received: from zn.tnic (p5de8e8eb.dip0.t-ipconnect.de [93.232.232.235])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 699E340E0163;
	Sat, 19 Oct 2024 23:21:50 +0000 (UTC)
Date: Sun, 20 Oct 2024 01:21:38 +0200
From: Borislav Petkov <bp@alien8.de>
To: Jens Axboe <axboe@kernel.dk>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	the arch/x86 maintainers <x86@kernel.org>,
	LKML <linux-kernel@vger.kernel.org>,
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>
Subject: Re: AMD zen microcode updates breaks boot
Message-ID: <20241019232138.GDZxQ_AtkqA9iAR2td@fat_crate.local>
References: <20241018115857.GBZxJNgZY-NedtPrxX@fat_crate.local>
 <20241018124943.GDZxJZZxtwA9O9eqiU@fat_crate.local>
 <79296353-1fa3-458a-b055-88bc6a772180@kernel.dk>
 <20241018155143.GIZxKED9YcF0Jg1CWZ@fat_crate.local>
 <320024ab-63af-45eb-a3ae-5486cb2015c0@kernel.dk>
 <20241018175606.GJZxKhNmW9nCLwNS6Z@fat_crate.local>
 <016ecb00-2331-472c-88e4-66b1dbecfc99@kernel.dk>
 <1bb5dd7f-15b5-4d9d-97ef-75ebdc24e7d9@kernel.dk>
 <20241019093748.GAZxN97LS_dJ3DNrpd@fat_crate.local>
 <436b4fc7-6369-40d9-8e88-556cbf5a5687@kernel.dk>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <436b4fc7-6369-40d9-8e88-556cbf5a5687@kernel.dk>

On Sat, Oct 19, 2024 at 07:54:07AM -0600, Jens Axboe wrote:
> Added that, and here's the full boot output until it crashes. Sent you
> the full thing as there's some microcode debug prints initially, and
> then some later on. Didn't want to miss any.

Thanks, I think I see it. It is that weird node-per-L3 setting which
apparently doesn't set up the ACPI tables properly or the loader runs too
early but load_microcode_amd() sees a very funky node maps. Node 0's first CPU
in the map is CPU 0, which is correct but then cpu_data(0) is a funky pointer
which causes the splat.

All the other "nodes" up to 31 have the first CPU in the mask as 512 which is
WTF?!

So the below is the same conglomerate patch but with code to dump those node
ids in load_microcode_amd() so that I can see what your system says.

It should boot ok now - fingers crossed - but let's see what it really does on
your machine. Just replace it with the previous one, pls, and send me full
dmesg again.

Thx.

---
diff --git a/arch/x86/kernel/cpu/microcode/amd.c b/arch/x86/kernel/cpu/microcode/amd.c
index f63b051f25a0..0d840a43b915 100644
--- a/arch/x86/kernel/cpu/microcode/amd.c
+++ b/arch/x86/kernel/cpu/microcode/amd.c
@@ -158,6 +158,9 @@ static union cpuid_1_eax ucode_rev_to_cpuid(unsigned int val)
 	c.family    = 0xf;
 	c.ext_fam   = p.ext_fam;
 
+	pr_info("%s: val: 0x%x, p.stepping: 0x%x, c.stepping: 0x%x\n",
+		__func__, val, p.stepping, c.stepping);
+
 	return c;
 }
 
@@ -613,16 +616,22 @@ static int __init save_microcode_in_initrd(void)
 }
 early_initcall(save_microcode_in_initrd);
 
-static inline bool patch_cpus_equivalent(struct ucode_patch *p, struct ucode_patch *n)
+static inline bool patch_cpus_equivalent(struct ucode_patch *p,
+					 struct ucode_patch *n,
+					 bool ignore_stepping)
 {
 	/* Zen and newer hardcode the f/m/s in the patch ID */
         if (x86_family(bsp_cpuid_1_eax) >= 0x17) {
 		union cpuid_1_eax p_cid = ucode_rev_to_cpuid(p->patch_id);
 		union cpuid_1_eax n_cid = ucode_rev_to_cpuid(n->patch_id);
 
-		/* Zap stepping */
-		p_cid.stepping = 0;
-		n_cid.stepping = 0;
+		if (ignore_stepping) {
+			p_cid.stepping = 0;
+			n_cid.stepping = 0;
+		}
+
+		pr_info("%s: p_cid.full: 0x%x, n_cid.full: 0x%x\n",
+			__func__, p_cid.full, n_cid.full);
 
 		return p_cid.full == n_cid.full;
 	} else {
@@ -641,16 +650,22 @@ static struct ucode_patch *cache_find_patch(struct ucode_cpu_info *uci, u16 equi
 	n.equiv_cpu = equiv_cpu;
 	n.patch_id  = uci->cpu_sig.rev;
 
+	pr_info("%s: equiv_cpu: 0x%x, patch_id: 0x%x\n",
+		__func__, equiv_cpu, uci->cpu_sig.rev);
+
 	WARN_ON_ONCE(!n.patch_id);
 
-	list_for_each_entry(p, &microcode_cache, plist)
-		if (patch_cpus_equivalent(p, &n))
+	list_for_each_entry(p, &microcode_cache, plist) {
+		if (patch_cpus_equivalent(p, &n, false)) {
+			pr_info("%s: using 0x%x\n", __func__, p->patch_id);
 			return p;
+		}
+	}
 
 	return NULL;
 }
 
-static inline bool patch_newer(struct ucode_patch *p, struct ucode_patch *n)
+static inline int patch_newer(struct ucode_patch *p, struct ucode_patch *n)
 {
 	/* Zen and newer hardcode the f/m/s in the patch ID */
         if (x86_family(bsp_cpuid_1_eax) >= 0x17) {
@@ -659,6 +674,9 @@ static inline bool patch_newer(struct ucode_patch *p, struct ucode_patch *n)
 		zp.ucode_rev = p->patch_id;
 		zn.ucode_rev = n->patch_id;
 
+		if (zn.stepping != zp.stepping)
+			return -1;
+
 		return zn.rev > zp.rev;
 	} else {
 		return n->patch_id > p->patch_id;
@@ -668,22 +686,32 @@ static inline bool patch_newer(struct ucode_patch *p, struct ucode_patch *n)
 static void update_cache(struct ucode_patch *new_patch)
 {
 	struct ucode_patch *p;
+	int ret;
 
 	list_for_each_entry(p, &microcode_cache, plist) {
-		if (patch_cpus_equivalent(p, new_patch)) {
-			if (!patch_newer(p, new_patch)) {
+		if (patch_cpus_equivalent(p, new_patch, true)) {
+			ret = patch_newer(p, new_patch);
+			if (ret < 0)
+				continue;
+			else if (!ret) {
 				/* we already have the latest patch */
 				kfree(new_patch->data);
 				kfree(new_patch);
 				return;
 			}
 
+			pr_info("%s: replace 0x%x with 0x%x\n",
+				__func__, p->patch_id, new_patch->patch_id);
+
 			list_replace(&p->plist, &new_patch->plist);
 			kfree(p->data);
 			kfree(p);
 			return;
 		}
 	}
+
+	pr_info("%s: add patch: 0x%x\n", __func__, new_patch->patch_id);
+
 	/* no patch found, add it */
 	list_add_tail(&new_patch->plist, &microcode_cache);
 }
@@ -964,11 +992,14 @@ static enum ucode_state load_microcode_amd(u8 family, const u8 *data, size_t siz
 		cpu = cpumask_first(cpumask_of_node(nid));
 		c = &cpu_data(cpu);
 
+		pr_info("%s: nid: %d, cpu: %d, c ptr: 0x%px\n",
+			__func__, nid, cpu, c);
+
 		p = find_patch(cpu);
 		if (!p)
 			continue;
 
-		if (c->microcode >= p->patch_id)
+		if (boot_cpu_data.microcode >= p->patch_id)
 			continue;
 
 		ret = UCODE_NEW;


-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
