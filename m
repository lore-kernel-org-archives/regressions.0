Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 817F98563E
	for <regressions@lists.linux.dev>; Fri, 16 Aug 2024 12:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723809631; cv=none; b=Y0DB4DovE36xd3Tyd8Ry3q2Exu4IUx6fgGlh1MxpglfAeFax/7spv+AI0ctv0YYv5AnC5LxB73tvcX2C7KDjfIStFqkMM/DRVej09bNRCP+qLu75aX55Dx2/jW6kV3sA4JtDZvrg1kvryaclKD8m7E9Kmp2IdSlVebw+eJSrPFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723809631; c=relaxed/simple;
	bh=i0Y1KmVWVrvEYzHwHjqEf3or3XmD3696jYz67yYOA4o=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=bfWKnDHRi3+bgAPPJmUlSZ1IOi3klreNnQJgdbS0FoHWsCQ4TGe8CxKkf+dCDZ6zMzeU0ObybXLgoXYOkiy6wRjenWWNMJXandLbRK1MVC9WKnUpKBZQP2KJA/fEJW5keKpoUeG/P3575V2F96QB0iPPdB3Di6qx1bLi2a0WRws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=iYSyrs8x; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="iYSyrs8x"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:References:To:From:Subject:MIME-Version:Date:Message-ID:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=i0Y1KmVWVrvEYzHwHjqEf3or3XmD3696jYz67yYOA4o=; t=1723809629;
	x=1724241629; b=iYSyrs8xYYZ9wakd4lBGvQXj1hZDv/cE30XdpyOtbAOmKgiMHtBDwuFre98Gp
	LNYKl3B2u3IOqYvkKnHpKHOmqU2atJPGu7PMnB4z4ph98IzWNSoifC/WQE46KKFWgKlhy0isAJWaN
	/rc67S2wQVL6GOYTvRDEaI8xnv6myzqJ6qyNMTUjqfyqPkE7BiaHEtaQVgIdHayvGDOadRQOGZHq7
	FopwmsUiRRnCpu9Ok9K9rha+B6Vb2nJBoOgdmJAazm/gCFqmKhHd6QWRhtZa1iL/3vJ8FEG9kH9we
	eGY5oQ9VnlHleTTHcl4X4wlcrMd/mzfntYCcuPgwTISSygYTWA==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1sevd5-00065o-6Y; Fri, 16 Aug 2024 14:00:27 +0200
Message-ID: <b78baef8-b601-4154-a489-71a9e432078c@leemhuis.info>
Date: Fri, 16 Aug 2024 14:00:26 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Thread for updating minor properties of tracked regressions
 [consider ignoring it!]
From: Thorsten Leemhuis <regressions@leemhuis.info>
To: Linux kernel regressions list <regressions@lists.linux.dev>
References: <fb0c84ab-5407-4a17-bbe7-832d8c4a51da@leemhuis.info>
Content-Language: en-US, de-DE
In-Reply-To: <fb0c84ab-5407-4a17-bbe7-832d8c4a51da@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1723809629;6c742dc8;
X-HE-SMSGID: 1sevd5-00065o-6Y



On 09.03.24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report: https://bugzilla.kernel.org/show_bug.cgi?id=219158
#regzbot introduced: v6.8..v6.9
#regzbot summary: alsa: Headset mic stopped working

#regzbot report: https://bugzilla.kernel.org/show_bug.cgi?id=219143
#regzbot duplicate:
https://lore.kernel.org/lkml/acaa3e31-a6f4-4c45-b795-d12b0d2743da@leemhuis.info/

#regzbot report:
https://lore.kernel.org/lkml/acaa3e31-a6f4-4c45-b795-d12b0d2743da@leemhuis.info/
#regzbot from: Martin

#regzbot report:
https://lore.kernel.org/all/1f76b7e2-1928-4598-8037-28a1785c2d13@redhat.com/
#regzbot introduced: 60fa6ae6e6d0

#regzbot report:
https://lore.kernel.org/stable/ZnMkNzmitQdP9OIC@3c06303d853a.ant.amazon.com/
#regzbot link:
https://lore.kernel.org/stable/2024071751-manhandle-taunt-00ef@gregkh/

#regzbot report: https://lore.kernel.org/lkml/ZpP3RU-MKb4pMmZH@eldamar.lan/
#regzbot fix: Revert "usb: xhci: prevent potential failure in
handle_tx_event() for Transfer events without TRB"

#regzbot report:
https://lore.kernel.org/lkml/20240729131351.27886-1-johan%2Blinaro@kernel.org/
#regzbot fix: 9a1af1e2187797

#regzbot report:
https://lore.kernel.org/lkml/2c7adbc9-609d-41a9-8a3b-a63d59e21a1f@roeck-us.net/
#regzbot fix: powerpc/mm: Fix size of allocated PGDIR

#regzbot report:
https://lore.kernel.org/linux-arm-kernel/PmbX6S6Osc50o8nCGiyOtYWlewq2QKXVo69V_1hkK0WeFxprG387m1JY619uKGK0Kynb7Jdb7plnUWfzKgV0UP9L7RIA4E2KnupKhIr5aYQ=@urja.dev/
#regzbot resolve: apparently fixed (bisect gone wrong? reporter did not
complain after a fix was mentioned...)

#regzbot report:
https://lore.kernel.org/amd-gfx/87138377-d5b0-4c28-96bd-35a0ffd5f204@kernel.org/
#regzbot duplicate: https://gitlab.freedesktop.org/drm/amd/-/issues/3495
#regzbot fix: drm/amd/display: Take Synaptics Cascaded Topology into Account
