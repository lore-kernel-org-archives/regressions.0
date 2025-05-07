Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B376F28853F
	for <regressions@lists.linux.dev>; Wed,  7 May 2025 13:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746623458; cv=none; b=hlSuqvvzeT+ukgtAIPw/Wlh3DoeK3Cx+AACjnhQeXTt99dmdUHDYoapXVeSOZCEKPSTrNaMeZAjkplpAzV99RyVrWcJnyvVO9mU526pj4+z2YP7iA2XSC4ZJh2TqeiF6pnhLN+fXt7AKuGsbwIG5Grjq8wiNJjXcgXQp0Z6Q6qQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746623458; c=relaxed/simple;
	bh=WfOna0qgipSseGCor8cmqiZDQkKFDIjCxDAj9rUOqxo=;
	h=MIME-Version:Date:From:To:Cc:Subject:Message-ID:Content-Type; b=mKzTWxir5pYXa913z6YMom1y0AdjCWpoKG29Uc50WvlNux6Z0ktb1fNgrMSr7I6ss1DCKq0G5V/GuOD5QUZXXBXdeqMzmSqMtux+oBjo5ZSmcRUXSS6aiLJXjDM5LKBO2GgJ9u6qdwKTgd/p8JCXfgxZfsuwGqKf7xeWn5NKF3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=A3TMBgoC; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="A3TMBgoC"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id C412525BEF;
	Wed,  7 May 2025 15:10:53 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k_f4BkDSiUgk; Wed,  7 May 2025 15:10:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1746623453; bh=WfOna0qgipSseGCor8cmqiZDQkKFDIjCxDAj9rUOqxo=;
	h=Date:From:To:Cc:Subject;
	b=A3TMBgoCVyygCkWMdgP9DTqPuj45j7FovrgekqUkC8DBsuFcbE1QVG+k0aXPZBdmg
	 kFaR/2Aa9+N3B4dH6sAxmGukQRn66bTh2iZsG3/qOJiIPLWyuVR5VKWX6MtAU0u5Ct
	 DmtXwj2ZO6TWIOLJzsVDM+w2zTPNTWPpN37MXZYnigiXTdLxTswHMuC/NPCfJgfTs2
	 gcFcqYVDBbGN7adqsYrPZdC7r1tE7bQx9ia+zHFIn249ytoxmNMFv0ZAj1sCLmGnTs
	 YGbPVmigk4gJKQx+s+z125YMLG9N37f4uC/uX9EPlIX8tvD7XLCoPXyTVSFaOiFkbt
	 bEYq5ur37jUbQ==
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Wed, 07 May 2025 15:10:53 +0200
From: machion@disroot.org
To: stable@vger.kernel.org
Cc: regressions@lists.linux.dev, amd-gfx@lists.freedesktop.org,
 alexander.deucher@amd.com, christian.koenig@amd.com
Subject: Unplayable framerates in game but specific kernel versions work,
 maybe amdgpu problem
Message-ID: <c415d9e0b08bcba068b01700225bf560@disroot.org>
X-Sender: machion@disroot.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

Hello kernel/driver developers,

I hope, with my information it's possible to find a bug/problem in the 
kernel. Otherwise I am sorry, that I disturbed you.
I only use LTS kernels, but I can narrow it down to a hand full of them, 
where it works.

The PC: Manjaro Stable/Cinnamon/X11/AMD Ryzen 5 2600/Radeon HD 7790/8GB 
RAM
I already asked the Manjaro community, but with no luck.

The game: Hellpoint (GOG Linux latest version, Unity3D-Engine v2021), 
uses vulkan

---

I came a long road of kernels. I had many versions of 5.4, 5.10, 5.15, 
6.1 and 6.6 and and the game was always unplayable, because the frames 
where around 1fps (performance of PC is not the problem).
I asked the mesa and cinnamon team for help in the past, but also with 
no luck.
It never worked, till on 2025-03-29 when I installed 6.12.19 for the 
first time and it worked!

But it only worked with 6.12.19, 6.12.20 and 6.12.21
When I updated to 6.12.25, it was back to unplayable.

For testing I installed 6.14.4 with the same result. It doesn't work.

I also compared file /proc/config.gz of both kernels (6.12.21 <> 
6.14.4), but can't seem to see drastic changes to the graphical part.

I presume it has something to do with amdgpu.

If you need more information, I would be happy to help.

Kind regards,
Marion
