Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E78615F335
	for <regressions@lists.linux.dev>; Mon, 27 May 2024 17:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716830261; cv=none; b=gQ/TAY3xzzXyOnKfeVel8iwMTHU2ucxQaOGVbQEqP01RkLdPXR8SOb5VAxFr718EvEx7/50NcG73Rg0DVJMumZbJwWnjFytNG5Y2m23A/0uXkdBxru8vA3lfQuCRSwPcI4U2aw1Q1uauknan8ENlKWjrIUSlxSFF/lOk0qRzknE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716830261; c=relaxed/simple;
	bh=3rxUTA1I4HerrioRN+3OBuqtmdLgl8iJBgIQ129TVv0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=HQXC4Kife1WSXzslkrxHrC3SHqRgJQG0wDCDQsTwuDqfe/ZIlSBFXMeY8voARl1N6JLcYS2lcBXqNMKhDyjsSYODuLskPn8okf4Mw74o0mfy1VERvgKdDg2Q0qxOA54RFZbdPTmdI4h2y4ATAUq7t099k+qvDrrd5ni1RfJYkJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=X5NyoCEb; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=xn9zxwmd; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="X5NyoCEb";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="xn9zxwmd"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1716830258;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TEUijocrU6T3aGS8zxSPcciq61yCZ/WDO0sL2+cY/T8=;
	b=X5NyoCEbyAv3ABYBlh7o8A7irGrnvxH1m4TKd7iNmw1qQOhKxQGkBhiz2ti2bkwuDielmP
	QrOJtN0zV++IpZqh2GBxJH5vZ/sjYnqbogD0S+AO4SBDTzuGhOc1pMenpLHNvoGQQUmiVu
	/FKtvbK4fMOudeAkuYDfDlJbdnNSwUX4SRoxyDq9u4kNjq58z9RYDLhfuM4au2ClVfYxYU
	smHzpcko8NNXH8I3ANUPkghgtgGDPTaBVzTWo5DjMyALu0IDCmHJSJ0DmNP6Dv/jgHO2GV
	NzmmAsYy/LLrRLsCwCG25iTTt5HVhNr9/hj8ScWwHduSYhugppp/lmtDHZgFSA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1716830258;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TEUijocrU6T3aGS8zxSPcciq61yCZ/WDO0sL2+cY/T8=;
	b=xn9zxwmdfJGjQSnL8bckNXa6H2UiG4De2taOAkc2QX12tlNDfsZwink/hat7+HDjeWUwu2
	czSIKKfiaCOUFbBg==
To: Tim Teichmann <teichmanntim@outlook.de>
Cc: Christian Heusel <christian@heusel.eu>, regressions@lists.linux.dev,
 x86@kernel.org, stable@vger.kernel.org
Subject: Re: [REGRESSION][BISECTED] Scheduling errors with the AMD FX 8300 CPU
In-Reply-To: <PR3PR02MB6012EDF7EBA8045FBB03C434B3F02@PR3PR02MB6012.eurprd02.prod.outlook.com>
References: <7skhx6mwe4hxiul64v6azhlxnokheorksqsdbp7qw6g2jduf6c@7b5pvomauugk>
 <87r0dqdf0r.ffs@tglx>
 <gtgsklvltu5pzeiqn7fwaktdsywk2re75unapgbcarlmqkya5a@mt7pi4j2f7b3>
 <87h6ejd0wt.ffs@tglx>
 <PR3PR02MB6012CB03006F1EEE8E8B5D69B3F02@PR3PR02MB6012.eurprd02.prod.outlook.com>
 <874jajcn9r.ffs@tglx>
 <PR3PR02MB6012EDF7EBA8045FBB03C434B3F02@PR3PR02MB6012.eurprd02.prod.outlook.com>
Date: Mon, 27 May 2024 19:17:38 +0200
Message-ID: <87msobb2dp.ffs@tglx>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Tim!

On Mon, May 27 2024 at 18:36, Tim Teichmann wrote:
> Right here is the output of the
> Basic Leafs :
> ================
> 0x00000000: EAX=0x0000000d, EBX=0x68747541, ECX=0x444d4163, EDX=0x69746e65
> 0x00000001: EAX=0x00600f20, EBX=0x00080800, ECX=0x3e98320b, EDX=0x178bfbff
> 0x00000005: EAX=0x00000040, EBX=0x00000040, ECX=0x00000003, EDX=0x00000000
> 0x00000006: EAX=0x00000000, EBX=0x00000000, ECX=0x00000001, EDX=0x00000000
> 0x00000007: subleafs:
>   0: EAX=0x00000000, EBX=0x00000008, ECX=0x00000000, EDX=0x00000000
> 0x0000000d: subleafs:
>   0: EAX=0x00000007, EBX=0x00000340, ECX=0x000003c0, EDX=0x40000000
>   2: EAX=0x00000100, EBX=0x00000240, ECX=0x00000000, EDX=0x00000000
> Extended Leafs :
> ================
> 0x80000000: EAX=0x8000001e, EBX=0x68747541, ECX=0x444d4163, EDX=0x69746e65
> 0x80000001: EAX=0x00600f20, EBX=0x10000000, ECX=0x01eb3fff, EDX=0x2fd3fbff
> 0x80000002: EAX=0x20444d41, EBX=0x74285846, ECX=0x382d296d, EDX=0x20303033
> 0x80000003: EAX=0x68676945, EBX=0x6f432d74, ECX=0x50206572, EDX=0x65636f72
> 0x80000004: EAX=0x726f7373, EBX=0x20202020, ECX=0x20202020, EDX=0x00202020
> 0x80000005: EAX=0xff40ff18, EBX=0xff40ff30, ECX=0x10040140, EDX=0x40020140
> 0x80000006: EAX=0x64006400, EBX=0x64004200, ECX=0x08008140, EDX=0x0040c140
> 0x80000007: EAX=0x00000000, EBX=0x00000000, ECX=0x00000000, EDX=0x000007d9
> 0x80000008: EAX=0x00003030, EBX=0x00001000, ECX=0x00004007, EDX=0x00000000
> 0x8000000a: EAX=0x00000001, EBX=0x00010000, ECX=0x00000000, EDX=0x00001cff
> 0x80000019: EAX=0xf040f018, EBX=0x64006400, ECX=0x00000000, EDX=0x00000000
> 0x8000001a: EAX=0x00000003, EBX=0x00000000, ECX=0x00000000, EDX=0x00000000
> 0x8000001b: EAX=0x000000ff, EBX=0x00000000, ECX=0x00000000, EDX=0x00000000
> 0x8000001c: EAX=0x00000000, EBX=0x80032013, ECX=0x00010200, EDX=0x8000000f
> 0x8000001d: subleafs:
>   0: EAX=0x00000121, EBX=0x00c0003f, ECX=0x0000003f, EDX=0x00000000
>   1: EAX=0x00004122, EBX=0x0040003f, ECX=0x000001ff, EDX=0x00000000
>   2: EAX=0x00004143, EBX=0x03c0003f, ECX=0x000007ff, EDX=0x00000001
>   3: EAX=0x0001c163, EBX=0x0fc0003f, ECX=0x000007ff, EDX=0x00000001
> 0x8000001e: EAX=0x00000000, EBX=0x00000100, ECX=0x00000000, EDX=0x00000000

Duh. 0x8000001e claims that there are two SMT threads. The original code
only evaluates that part for family >= 0x17. I missed to forward that
condition.

Fix below.

Thanks,

        tglx
---
diff --git a/arch/x86/kernel/cpu/topology_amd.c b/arch/x86/kernel/cpu/topology_amd.c
index d419deed6a48..ebf1cefb1cb2 100644
--- a/arch/x86/kernel/cpu/topology_amd.c
+++ b/arch/x86/kernel/cpu/topology_amd.c
@@ -84,9 +84,9 @@ static bool parse_8000_001e(struct topo_scan *tscan, bool has_topoext)
 
 	/*
 	 * If leaf 0xb is available, then the domain shifts are set
-	 * already and nothing to do here.
+	 * already and nothing to do here. Only valid for family >= 0x17.
 	 */
-	if (!has_topoext) {
+	if (!has_topoext && c->x86 >= 0x17) {
 		/*
 		 * Leaf 0x80000008 set the CORE domain shift already.
 		 * Update the SMT domain, but do not propagate it.
