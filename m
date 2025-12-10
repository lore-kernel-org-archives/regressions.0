Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FB143246F1
	for <regressions@lists.linux.dev>; Wed, 10 Dec 2025 12:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=195.140.195.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765370192; cv=pass; b=UX3NouOVS6CIJUDoPF2ap8GEa6Q8Z9355YTHCBhWS0tOtGdMR95kJgSBKe1x0MPAyo3vM5SVln6twCCOV+1L9EdFtOEwWukvOahnFHdS7hOoCh04Vlv5hG4R835q/kDykPP9gBrhHq4YD3dBEjcPACSsiz63r7s6prOpgkgZ5MM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765370192; c=relaxed/simple;
	bh=Fuc2GoHwCJq96l90crplLT80Ent3ZY/qTt10j6NqniM=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Iy2W8JIo178yIivqec4+rVQj178A/qKcJii3vNHmm5TgK4prd39YtRfqt/4enbkSrq5ywjd1YW8n767OVT45SP8t5yRN6/fLiBCnNIV1S592kUZWDV3+/dV9lUPqf3fHw4ja4XXrf6kqayVuQZI5bHQFAZEq/exnoP1oiiR2C3k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b=DzELVdZc; arc=pass smtp.client-ip=195.140.195.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b="DzELVdZc"
Received: from mail.home (212-90-86-103.bb.dnainternet.fi [212.90.86.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: timo.lindfors)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4dRFZb5ybZzyQH;
	Wed, 10 Dec 2025 14:36:23 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1765370185;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SM4/DYpAoX2OHJKWTtMBgck5YzGO83IGE2Ol5R7rY+g=;
	b=DzELVdZcX2l8aUIYnxx+Le/a4bUhw/ZM0PWgIJF/b4/lgYXRgmodJ+Fj2B81UYKoQVUNOe
	iP5NohO9Wt8euj3W1Gz0bCRQWyy8Ozu2aTLYwumtPE3aX8JZJcJlWS8JX5ls1CFD5q82Un
	pKa2fSmYsYTCU6Y63dvUBqHZXf45oAU=
ARC-Seal: i=1; a=rsa-sha256; d=iki.fi; s=meesny; cv=none; t=1765370185;
	b=JYNpq39zyemGiMb1t7ad5v6kCUrhRJzfMJZkWIMDzFhpK08X080Ea8aZAB+SR/6hdfHsB2
	K7zx6cXmTNOSxzB7qF2E4UdnRtfhzWyrt6/Lv0xO7sQC8blbUkeJrLZgY68VVQ8KHe2nMr
	HCGeS9GLpS5u0vL+jte+1saB2KMP5cs=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=timo.lindfors smtp.mailfrom=timo.lindfors@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1765370185;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SM4/DYpAoX2OHJKWTtMBgck5YzGO83IGE2Ol5R7rY+g=;
	b=CLDOKjX7Cu32PfV0NVCiO1qUclJ1F6tK4v16U3a9oSydenaUzfUUZqTQD+9YPTLprRkVFQ
	QlCrC6XnFz11Jkq5qqX/Q+Qa0DkK5bNFbspliqLnKTZ0jP1OhVlRlgJtU6YigyUm1cqj3M
	OgbiywM7mMlrI+xI9lYNmDBRrjHD/eA=
Received: from localhost ([127.0.0.1])
	by mail.home with esmtp (Exim 4.89)
	(envelope-from <timo.lindfors@iki.fi>)
	id 1vTJQd-0006HY-DS; Wed, 10 Dec 2025 14:36:23 +0200
Date: Wed, 10 Dec 2025 14:36:23 +0200 (EET)
From: Timo Lindfors <timo.lindfors@iki.fi>
To: Salvatore Bonaccorso <carnil@debian.org>
cc: Matt Marjanovic <maddog@mir.com>, 1054514@bugs.debian.org, 
    Maxime Ripard <mripard@kernel.org>, 
    Alex Constantino <dreaming.about.electric.sheep@gmail.com>, 
    airlied@redhat.com, daniel@ffwll.ch, dri-devel@lists.freedesktop.org, 
    kraxel@redhat.com, linux-kernel@vger.kernel.org, 
    maarten.lankhorst@linux.intel.com, regressions@lists.linux.dev, 
    spice-devel@lists.freedesktop.org, timo.lindfors@iki.fi, 
    tzimmermann@suse.de, virtualization@lists.linux-foundation.org
Subject: Re: Bug#1054514: linux-image-6.1.0-13-amd64: Debian VM with qxl
 graphics freezes frequently
In-Reply-To: <aTiTnENWsCoTbT3U@eldamar.lan>
Message-ID: <alpine.DEB.2.20.2512101433240.24105@mail.home>
References: <alpine.DEB.2.20.2310242308150.28457@mail.home> <b8b1497f-789e-4bb7-be17-9d3ebb30c143@mir.com> <aTiTnENWsCoTbT3U@eldamar.lan>
User-Agent: Alpine 2.20 (DEB 67 2015-01-07)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed

On Tue, 9 Dec 2025, Salvatore Bonaccorso wrote:
>> This is back in trixie --- unsurprisingly, because the kernel commit which

Indeed. The reverst of the problematic commit was reverted in mainline 
kernel. I have spent several days trying to understand the problem but 
unfortunately I don't have enough time to troubleshoot this more.

I tried switching to virtio but for my use case of remote Linux desktops 
it is not usable. If I scroll a fullscreen web page I can see how the 
whole screen is redrawn every time,

Meanwhile I've switched from SPICE to RDP. GNOME in trixie supports 
headless RDP sessions that make this very convenient. Client support is 
also much better for RDP. I solved the authentication problem by isolating 
each VM from each other on network level and then deployed rdpgw 
(https://github.com/bolkedebruin/rdpgw) in front of everything with OpenID 
authentication.

-Timo
