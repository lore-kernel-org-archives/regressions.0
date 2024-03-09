Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 350352E62E
	for <regressions@lists.linux.dev>; Sat,  9 Mar 2024 12:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709988002; cv=none; b=Hy5NPcyrcoRwS7TVF/vvGdTlu0pMxjDuoQSU5TRwV8aPmCPU7BQuS6yNE+R0gMehy+skqRMqSZRL51LA4kFVBqyK82QRM8ji7N2/LNIGJXcGETBEafOjrYfutQMCgvsb4GmgMo2U3QZHZCB9zVSblGHNvgPWMtixgnvR3A4aH2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709988002; c=relaxed/simple;
	bh=1KpRuStLbmXHkKsZWXYuN7+hVxDUo1iAJFXwMTXLQeo=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=RhBJzY8eIQd/jPP3EFiCFuKtMy98ncGCB48yKQ0Ldm7QZ+oeMxQ0uQ8zpK99sRbFLxrICjZstTlRxj4rB2F1TJpk7za43BrCnBflf+2UXhcUzIIbiRPNrZKEQdwK0PQa/4HTH83JegCATYPno87NKyTu7n70PBDrIvgcQLD+67g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=UnHVdUgn; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="UnHVdUgn"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:Reply-To:References:To:From:Subject:MIME-Version:Date:Message-ID:
	From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=1KpRuStLbmXHkKsZWXYuN7+hVxDUo1iAJFXwMTXLQeo=; t=1709988000;
	x=1710420000; b=UnHVdUgnYnnS08sq23ipUxpMuTeVfL/YRPSyS6ZbltmUKWbPPzOMbSDCafg2E
	YdUd+nOEgzYj9RZVsfvq0/ZM3l8dVn5zVBd9/wPcj15hhDmsqzoPcZfsy9TTVtA/nqtckesEWHBMx
	aZBCd2g2VYCZNjfgy+Y32lXVsB3JWIWwvdAX5q+5iCBHeXOxiVmGU53NO6XMalhnAFKf4r3bYUbxg
	0x7x+cUvQQ/Cy0kSFVaVrVz+awYJ5FGVCh0XWOiN9O9uAvmJehifK8lQ5xSMA+QkWK7bhRNJOIGWM
	A/4dXPT9NOTp6I4ETD2i9uzoudFWM/rsrGjXOstI4dE5M8XO+g==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1rivza-0002h2-Ad; Sat, 09 Mar 2024 13:39:58 +0100
Message-ID: <2ae922be-6e80-4bdf-9207-853f60a4e61c@leemhuis.info>
Date: Sat, 9 Mar 2024 13:39:57 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Thread for updating minor properties of tracked regressions
 [consider ignoring it!]
Content-Language: en-US, de-DE
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
To: Linux kernel regressions list <regressions@lists.linux.dev>
References: <fb0c84ab-5407-4a17-bbe7-832d8c4a51da@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <fb0c84ab-5407-4a17-bbe7-832d8c4a51da@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1709988000;82b4619d;
X-HE-SMSGID: 1rivza-0002h2-Ad

[of course the first real use of mulitple "#regzbot report" in one mail
resulted in some problems I missed and fixed, so trying this again]

#regzbot report
https://lore.kernel.org/stable/3a1b9909-45ac-4f97-ad68-d16ef1ce99db@pavinjoseph.com/
#regzbot relate
https://lore.kernel.org/all/CAJbxNHe3EJ88ABB1aZ8bYZq%3Da36F0TFST1Fqu4fkugvyU_fjhw@mail.gmail.com/

#regzbot report
https://lore.kernel.org/regressions/ZeoAPFIF6NClUl4P@debian.local/
#regzbot unrelate https://gitlab.freedesktop.org/drm/misc/kernel/-/issues/36
#regzbot duplicate
https://gitlab.freedesktop.org/drm/misc/kernel/-/issues/36
#regzbot summary drm/nouveau: divide-by-zero on DisplayPort MST unplug
