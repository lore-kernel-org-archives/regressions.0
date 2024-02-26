Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08FEA7EEFC
	for <regressions@lists.linux.dev>; Mon, 26 Feb 2024 12:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708950776; cv=none; b=edHyWfXbo47EW3O3wdpYe0wa6muNd4roA0R2PbabQ6dVNHdJYA1n0t90zZoPswznj0xJiFIAliv1ww4ianMFNN5y8gu+LATMhhP9QnKoarJTk1fr+WC9OmXFWtVvDbh2nHToqIvLy1/08ZwckGT94vHUjRlgUCcXouaXzo3SeRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708950776; c=relaxed/simple;
	bh=TOinibaoeeuglSCqGrRceZ/5pavWN6fZtE7b7OSbD8s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aXm22XHngZpW+ICOgZS0i/IRl/M3KSwhpCIHiPNayvlbBuZLYiXVc8o+LZmC0DJI831tJ+852Iw0gqUuFy3tlA/LB2xu6izEfzM5f/82lRkvd/TopjtYXsC/GJMSmhNBJ7YkREhpTEntCHRMOHVS6b61HbLGe/P5ohwYxPSGI54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=FKZUlHBf; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="FKZUlHBf"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:
	Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
	In-Reply-To:References; bh=naPjzZspUJvzWT+GJjwqLixXs8B0ZAsekA6k8xvkWCk=;
	t=1708950774; x=1709382774; b=FKZUlHBfGdpiwdJYdHYTR8IC5UZ46ZEEMGmmajfrXQ60WUg
	WVfVDkE4oDVi6E1ZVTAIqBcGOtzwu46E3dKG1Ze4T79pzcRMWuGA/5D6cDNCeq9ay+sl960V7Qped
	4N3aK5EKhKXEfa8tlltFJ4134lE+e56fSjuU+oZu8a8Mv0jwHVEfivk8A/nad6gNytuqx3miwbzEL
	MLdTJ8J73XC6AqALlGK/uOM0gntkgfgxNVIkBIEqi1gArIjkdmYhv8iGC7GxgGFoI+3x95yT5fH1N
	tyzWkKlzhNtb9Ktck5VjRJ8nhcMass313WqGgcmUif0in1rtFrwOHV6ZXzTv987Q==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1reaA7-0004cs-Fb; Mon, 26 Feb 2024 13:32:51 +0100
Message-ID: <a037cb7d-426e-4cd0-9ebb-f299aa48dcf1@leemhuis.info>
Date: Mon, 26 Feb 2024 13:32:49 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] sc7180-trogdor-lazor image corruption regression for
 USB-C DP Alt Mode ([PATCH 0/2] Add param for the highest bank bit)
To: regressions@lists.linux.dev
Cc: freedreno@lists.freedesktop.org
References: <20231207213048.1377147-1-cwabbott0@gmail.com>
 <85581fad-da8f-4550-a1c8-8f2996425dcd@lausen.nl>
 <CAA8EJpoqS856N8w3ZxdhQ0TUVP2u5K8qCjG=qLQPnHXGH9NyNg@mail.gmail.com>
From: "Linux regression tracking #update (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Content-Language: en-US, de-DE
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <CAA8EJpoqS856N8w3ZxdhQ0TUVP2u5K8qCjG=qLQPnHXGH9NyNg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1708950774;309fa72d;
X-HE-SMSGID: 1reaA7-0004cs-Fb

On 18.02.24 14:31, Dmitry Baryshkov wrote:
> On Sun, 18 Feb 2024 at 03:17, Leonard Lausen <leonard@lausen.nl> wrote:
>>
>> Hi Connor,
>>
>> unfortunately, your series https://patchwork.freedesktop.org/series/127529/ has introduced a regression for external displays connected through USB-C DP Alt Mode, at least on sc7180-trogdor-lazor devices. Do you think it's possible to  fix this before the 6.8 release or would it be better to revert the series? I'm happy to help testing any fixes. The issue is also tracked at https://gitlab.freedesktop.org/drm/msm/-/issues/49.
>>
>> Thank you
>> Leonard
>>
>> #regzbot introduced: 8814455a0e54ca353b4b0ad5105569d3fdb945cc
> 
> #regzbot monitor https://gitlab.freedesktop.org/drm/msm/-/issues/49

This is a duplicate, thus handle it as such:

#regzbot duplicate https://gitlab.freedesktop.org/drm/msm/-/issues/49
#regzbot ignore-activity

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
That page also explains what to do if mails like this annoy you.


