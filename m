Received: from out-188.mta1.migadu.com (out-188.mta1.migadu.com [95.215.58.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C301330D25
	for <regressions@lists.linux.dev>; Fri, 20 Mar 2026 09:28:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773998896; cv=none; b=iVgst2CUGiasVpeOH+g0Mt/fI9xnRWf0PHsz8zSJCP+3gJxxUtf3p9f8nDBe3XM6AJFLCZi8s1bKFtEOmSgCGO+jnMZUVNjSU6fEPMbyNXRRtngzJR/t12Io4buKWQnWU9MKyZwJmkY6E6+XlCbxtwf+QDueAOBSg3vEzFSyXGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773998896; c=relaxed/simple;
	bh=rNO14Di7KZnMVWefKhh0ij9quz7UDkBl4bwAflBVCFo=;
	h=MIME-Version:Date:Content-Type:From:Message-ID:Subject:To:Cc; b=o9WdGBzxaXHlQ/0RDNS6TdvCdrprjAlXUQOG+NsatFvaTHpI7lFIYKW8Ay9g7QuCTDZqOwjcB+ankRhQfsmVHXR0erNnd6ILDrdV/jHQFrWiSxy8scdCag4OYiwa+uMZkIXtXxWVuktYkibgofnGl6oRSyF50M9F0Clve1tEfc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qpok.net; spf=pass smtp.mailfrom=qpok.net; dkim=pass (2048-bit key) header.d=qpok.net header.i=@qpok.net header.b=FZzupXFV; arc=none smtp.client-ip=95.215.58.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qpok.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qpok.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qpok.net header.i=@qpok.net header.b="FZzupXFV"
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qpok.net; s=key1;
	t=1773998891;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=6cu10aOjRylqbgtDpJ7kKRC5JYCqevnVQUIUK77SSis=;
	b=FZzupXFVrgnabe7HqLP3wiNPOiMidvL5zcX4JDSfOlb2ecUGf0U9RPeElY6+GNuXpizWZY
	cINY0L8DTG2GvzlQ9aOVG7tBxpJ7l5A+e8Ukhtdiy8Uwt3OOkIKbdNxLuVr1J9JM/E9EZR
	AzzV89VQqYhuB2tpj4a6/woVvojivwWZoF2XacaIhSkt0cl4CJbXpX3U5Negfj/zQWiuj4
	EIK05r1PJsulirpfNSWsmeklrlBOC8YEsGO/gMw38pP7VdxFe8WKJr+s3rz+CzALUIT/I8
	YBdNXuokp4vvZNk9nrP+i0sh8scMkOu9YNap0Wnta/szCDBP4TxEF6vIjeDB4A==
Date: Fri, 20 Mar 2026 09:28:06 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Mark Somerville" <mark@qpok.net>
Message-ID: <1be114e1130ca59ee91fc5a73aaf43a912d408ea@qpok.net>
TLS-Required: No
Subject: [REGRESSION] Unable to pass AMD RX 6400 GPU via VFIO
To: stable@vger.kernel.org
Cc: "Mario Limonciello" <superm1@kernel.org>, regressions@lists.linux.dev,
 "Alex Deucher" <alexander.deucher@amd.com>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "=?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?="
 <christian.koenig@amd.com>, "Xinhui Pan" <Xinhui.Pan@amd.com>
X-Migadu-Flow: FLOW_OUT

Hello maintainers!

I run Debian 13 stable (6.12 kernel) and have encountered a regression.

My machine has three GPUs, the iGPU that is part of my 7950X and two dGPU=
s - one NVIDIA 3090 and one AMD RX 6400. I use the iGPU for the host and =
only use the two dGPUs with virtual machines via VFIO with libvirt.

Although I have specified kernel parameters vfio_pci.ids for the GPUs, I =
have not blacklisted the amdgpu driver so that the host iGPU can operate.=
  Previously, starting a VM with the RX 6400 dGPU assigned to it (via VFI=
O) would work fine. However, doing this with more recent stable kernels c=
auses the machine to hang immediately (and then, ultimately, reset after =
a while - ~30s). No errors are logged, at least as things are configured =
just now.

I can reliably reproduce this crash and a bisection revealed the commit t=
hat introducted the problem: 8140ac7c55e75093a01c6110a2c4025fe7177c57.

This is fixed in the mainline kernel, I have tested and verified my RX 64=
00 is working with VFIO under 7.0-rc4.

I *think* this is still present in the 6.12.y branch but a second (curren=
tly ongoing) regression is preventing me checking this on the latest and =
greatest 6.12 release right now.

Working:   6.12.63
Regressed: 6.12.69
Working:   7.0-rc4

#regzbot introduced: 8140ac7c55e75093a01c6110a2c4025fe7177c57
