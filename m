Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F1CE13A256
	for <regressions@lists.linux.dev>; Wed,  7 Aug 2024 09:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723021338; cv=none; b=ijiC1G7AqKGnAu2U6ajWqC4kuh9shpZZtRDq7BTly8D7tHo8SV5rWGcADGdLcwKkgIhxbfZynqPdJIWzrcuqUk6okFbDcI7aduXRUzEoG94e1Rdgqy/mWrmvXKJLtlkg6MCFby6b76wPw0U6B7m59FpIUBWKWgyRRF/pWgQcxP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723021338; c=relaxed/simple;
	bh=oHdbS7BwmMdOfwMiZJSHAnlUygNjCzqq3ytI5PoYWGE=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=V8pXT9AwGOsYYmauoyxgJaWvY3ZCSpUWw0nv/+ygXTk4bEB+gAE4bLGZ1NOiZWc5QWSB7Nh0UJ3fniurDLwgrwi0b1NhQAOAvxFB6ihOlbJgjc3CKiuPpfQpYh6Qfe/5PJxu3MG1IUJr2yp2nUg32F5kQo9OntMs2KEBDMEPkes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=3jvtbmPn; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="3jvtbmPn"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:References:To:From:Subject:MIME-Version:Date:Message-ID:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=Og9C2X0to0rBrQPWEtrnZ/7hD9APxVioyjQCc+rKfN8=; t=1723021336;
	x=1723453336; b=3jvtbmPnwcGe96285jBorhdrQNAp+a7tSwxiTuqhWnvEbInyVlY23NHIRy3J1
	bUiPpuuCqyazQjc21wd7KUGh74K1K8SNl+VukyvKw+vSlwtX8csQJXEtKJn2nkF5k7X7lkapFeLW2
	LhJkscMVsWRsCc7AJMUjjQrgloE5pqabPI090+fj9Cq7W9oz0eDZJB7FwzR+lGwtas+TlyOt3u1gR
	B4Q3R2u1ogClqTmEk4HoNf6zaxYqSCibtiAd2ff1mZ5LSwh532P5W4fctl31ujQqzYAUYiqB/TnZu
	afLWzoGq58hGrc7+oy2KDmmNw4lrGUw/7cgruKdvwQ2ZNiSq2Q==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1sbcYg-0007yT-5Q; Wed, 07 Aug 2024 11:02:14 +0200
Message-ID: <35a43a00-0212-4f76-a9a5-e5d1db65486e@leemhuis.info>
Date: Wed, 7 Aug 2024 11:02:13 +0200
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
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1723021336;5d37a138;
X-HE-SMSGID: 1sbcYg-0007yT-5Q



On 09.03.24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/all/202408041602.caa0372-oliver.sang@intel.com/
#regzbot introduced: 8be7258aad44b5e25977a98db136f677fa6f4370
#regzbot summary: mseal: performance regression
#regzbot fix: mseal: Replace can_modify_mm_madv with a vma variant
#regzbot monitor:
https://lore.kernel.org/all/20240806212808.1885309-1-pedro.falcato@gmail.com/

#regzbot report:
https://lore.kernel.org/all/20240806212808.1885309-1-pedro.falcato@gmail.com/
#regzbot introduced: 49b29a573da83b65d5f4ecf2db6619bab7aa910c
#regzbot summary: nfs: TX TLS device-offloaded flow  broken

#regzbot report:
https://lore.kernel.org/all/CABXGCsNgx6gQCqBq-L2P15ydaN_66sM9CgGa9GQYNzQsaa6Dkg@mail.gmail.com/
#regzbot introduced: 1b04dcca4fb1
#regzbot summary: drm/amd/display: launching some RenPy games causes hangs

