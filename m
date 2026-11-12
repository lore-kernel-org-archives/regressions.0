Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=65.109.113.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794444199;
	b=eHzq29Su6V8OzjgK8AeRnq1Wy2QlTM4Jx21oypdAIKAaMxmiN3hIY6IBemj/N6WoTdoK
	 uehdcJe3OHiX0GCbviZ22R9av4ysuWTRXbEngQfk5i+Y7H9Zb/Jx+sh5mos1fR+wVFcW4
	 j0mosyHsUuq3gac8jExR3Y8uvoPD+0l2LdPidsFoxcmb0RUjHJ44cdVloRLvvSszetLsq
	 8PZKZCVzThNgGenhzG93KzRmPvP6OvoXsWoVpdTrEjmpPduGdNNFhSd/A0+q0QgIUjA+s
	 NEF2vY7DEkboNyX3d/oQaQTMB4YXwHN4xe2g0pZLErniE4dLdhOrNu7mZOLtRaAilFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794444199;
	h=DMARC-Filter:Received:X-Virus-Scanned:Received:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=Y+LIaShdy+NAueNuoaxr9CPb9YXKMHpHNsotH+IG2Ns=;
	b=cuokGeAa3qMFueAdISnTP9eZKzCmvolrPB0l83EOWxgLyN2wiGDIINl8CN8FQbdgobDD
	 SHX74EyDK0AVwGG9T2Xb3ql9fQV9NAwu91/ISHlF0h50TzkSEZ0biqM9TOlETwVOjhVXE
	 yr1kSG9F+FVeDPUzkiIiYtJEVZ8/3O5bPrTDMQ6tnJEqqKG7GIqELqPHPdlkB2Y3hPLF1
	 E8PxjSGo2to/oDTqxrv23nYAtqasfUVi/NBMAM4ViY2AOO1tNNfdn2wqGe8b+E8K+gGVw
	 Yk70st8ZTsLHQJa2OcXZFLsv9XFV+NrNE9QXDlxkD9mSOtCAeYJG6a1bo1yu2d6KvzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=alien8.de;
	spf=pass smtp.mailfrom=alien8.de;
	dkim=pass header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=GpeRwg1C;
	arc=none smtp.remote-ip=65.109.113.108
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C28E9606A31C
	for <regressions@lists.linux.dev>; Thu, 12 Nov 2026 00:43:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C28E9606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=GpeRwg1C
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 9CEAB40E021A;
	Thu, 12 Nov 2026 00:43:16 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id hzzgz8LfwlL4; Thu, 12 Nov 2026 00:43:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1794444193; bh=Y+LIaShdy+NAueNuoaxr9CPb9YXKMHpHNsotH+IG2Ns=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GpeRwg1Cd0PPyIBBH5I6TCZvhnzRRqW3QN1ahJbD8OHPO2zItx35OvsqblgFbNbty
	 upwrhcRh90pXSFrarQE086Wvg10ypoIpEMXgXBi/qDs9yygoYDeYOcd5+eQfPHb37L
	 r9bPTbY0FTTDyB8ud6tdAhX4pdCEoxOa09rOVgzzd80o4JP6Ih9SM2jzUdzE4h6AzK
	 71O/b7S4amPYwi3w4frjH8yoAfRMhwrb3Qt2p92AfrXa/yTx1ht2miCztRIDYahTnH
	 PZe+VySgm+kONjU5DDS5peZZ4Yu6DRRq8y8/57z4EeRlH/Ce68lgCunqcHk0nFyrdh
	 ovxZNHoWMTxH33fAq6eiIKVl/b/06PbDRhZfgo47Nh8ZSskotPfgOIRIoR9Dy/xk7/
	 szm9Y+6QBhWneUIjAAoEG4Eu0ajYPNtUpyKAnqfc82quXEzSWQIss/XyqwYUEpr31n
	 ugn8oqU9khxWrGiBoGggudfxlu8OJa414xZoMxLBDmVTCyP2pcttAgFZamVOD7eyBb
	 TC17TOno7N5IyCqX/nz6FsbMIdRr8eUms+PFQkOf3eHhB0evqTosqTkMK1FCz+QQTb
	 SpPVpNilZw8eDi3iVZENg4Dxx70nGR0BRsrPVQrUZcTvCd6/9cloNXy8sLpUU5Gek6
	 e7ruSw58MRakWBOPrWl8JzQE=
Received: from stx.tnic (unknown [209.52.143.85])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 7E04D40E0218;
	Thu, 12 Nov 2026 00:43:06 +0000 (UTC)
Date: Wed, 11 Nov 2026 16:42:54 -0800
From: Borislav Petkov <bp@alien8.de>
To: Dario Ackermann <dario@darioackermann.ch>
Cc: Thorsten Leemhuis <regressions@leemhuis.info>,
	linux-kernel@vger.kernel.org, regressions@lists.linux.dev,
	x86@kernel.org, tglx@kernel.org
Subject: Re: AW: [REGRESSION] x86/microcode: boot hangs bringing up first
 secondary CPU on i7-6700HQ, avoided by dis_ucode_ldr
Message-ID: <20261112004254.GDavULjhoMSf2Sz5DI@fat_crate.local>
References: <mw9nsyuj.70b4b79c-e987-49da-abe1-0164defd8d5a@darioackermann.ch>
 <630330232567670562275469.6204.202611921938@darioackermann.ch>
 <8a0a9e63-54c2-4e5d-9479-1e39946328c4@leemhuis.info>
 <691747894523180440145931.1352.2026111016821@darioackermann.ch>
 <20261110185257.GFavNoCWszSXhRkaOV@fat_crate.local>
 <067545724320102351351556.0634.2026111194556@darioackermann.ch>
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <067545724320102351351556.0634.2026111194556@darioackermann.ch>

On Wed, Nov 11, 2026 at 09:45:52AM +0000, Dario Ackermann wrote:
> 6.1, and yes. I had only tested the Manjaro build before. Vanilla 6.1.189
> also updates early to 0xf0 and brings up all eight CPUs
> 
> https://drop.ackd.xyz/n552vx/dmesg-6.1.189.txt

This one looks incomplete. Does it stop booting here?

BUT, before we continue here, I would like you to remove the proprietary
nvidia module completely and then try catching all dmesg again.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
