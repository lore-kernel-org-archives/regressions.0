Received: from gmmr-4.centrum.cz (gmmr-4.centrum.cz [46.255.227.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9364613A240
	for <regressions@lists.linux.dev>; Fri, 26 Jul 2024 10:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.255.227.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721990284; cv=none; b=Rx19ZIbbtamL0gsL2kYbdxDpLLkiLOntU7ruByRJHjx8hlMrqhqCcR/NBfmveZBITig5V+bREA3fRMF8HHQETnmMMAtRG3WJMLXu3Hr2vr4Y8rIMrCSsKaPir6kNG1qbvEv/71if7HLYXRAhDlP3TfBjqtYBW27OSAkmDqJRX1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721990284; c=relaxed/simple;
	bh=GXTxWdLNKxmrL63ov/Lg+qbfgFHpMG+OrSTgSuk1t18=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=hG3k4DJrrxi9j5JpqCWuZqVx5Wr+y9NeRG23wzU6Ys2FDgslew+93mI129/KOr/U9W7zAWANC6wHv5PLiBJNgP0TCjCxBVbRvLA+UhGzCsZF+7kWjnWrCw4c2WZ2wjUCJfr095tAS+pt/elWR6B/cOXUHGhow0vF+v2N+eCRlzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=volny.cz; spf=pass smtp.mailfrom=volny.cz; dkim=pass (1024-bit key) header.d=volny.cz header.i=@volny.cz header.b=PRPPvzTI; arc=none smtp.client-ip=46.255.227.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=volny.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=volny.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=volny.cz header.i=@volny.cz header.b="PRPPvzTI"
Received: from gmmr-4.centrum.cz (localhost [127.0.0.1])
	by gmmr-4.centrum.cz (Postfix) with ESMTP id EBA652275
	for <regressions@lists.linux.dev>; Fri, 26 Jul 2024 12:36:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=volny.cz; s=mail;
	t=1721990192; bh=FDVD6Aq/Y3zdjFYN0JIMrnQ78BRMQbuEndYlpaj2pPU=;
	h=Date:To:Cc:From:Subject:From;
	b=PRPPvzTIPOZPiYiqLzJgWAmhVQmTuHOAn0h7VMBXbK5dCt53ld6inMbWpT/McLcsC
	 Dev/YglC6MpdmFHA9CIHJPMRuQhwdj5RXpe67UjKmVa31FR9Y7XGepMkgzaMQsfb8T
	 rwigo/97ykBF1mVViuMvmvYD49YWPmgOhP4whypg=
Received: from antispam34.centrum.cz (antispam34.cent [10.30.208.34])
	by gmmr-4.centrum.cz (Postfix) with ESMTP id EA81F200B096
	for <regressions@lists.linux.dev>; Fri, 26 Jul 2024 12:36:32 +0200 (CEST)
X-CSE-ConnectionGUID: 6Gpmm/7MRrC9PTLyQDqR/Q==
X-CSE-MsgGUID: j5Nwsh2JTpOsdZTc1npiGw==
X-ThreatScanner-Verdict: Negative
X-IPAS-Result: =?us-ascii?q?A2HuBABRe6Nm/03h/y5agQkJhQaGOpFthD6NbIUfiAs+D?=
 =?us-ascii?q?wEBAQEBAQEBAUQJBAEBAwSEOUaJPSc4EwECBAEBAQEDAgMBAQEBAQEBAQEFA?=
 =?us-ascii?q?QEGAQEBAQEBBgYBAoEdhS9GDYJgGIESgSYBAQEBAQEBAQEBAQEBAQEBAQEXA?=
 =?us-ascii?q?g2BJxVBKA0CJgJzAQGCfAGCZBStF4EyGgJlhHvZFzWBUAaBGi6EcAGDTAGIJ?=
 =?us-ascii?q?IItAoECgQlEgTwLiEaDDoJpBIgZihEWgh4IFoEYiCgkAoE0jBqBEQMJBgICA?=
 =?us-ascii?q?g8XFgYDWSEBEgFVExcLCQIFEIlggy8pgW+EG4FJAYNkgWsMBF2BXxCFQheCH?=
 =?us-ascii?q?4E+gV+DQUuFaUwgHRMtAgELbT01CQsbBj2iJQGDBYFtLxAUPHUaIzGkQYxVl?=
 =?us-ascii?q?QwHA2KDM4RNh0eVKgYPBC+DchONAIZLFgOSVZhtjXqdFYFrDQeEKFEZkirMS?=
 =?us-ascii?q?4ExAgcLAQEDCYkigUoBAQ?=
IronPort-PHdr: A9a23:LoOgmBUjFbJHywrxuC7itGFKHUfV8KxMUjF92vMcY1JmTK2v8tzYM
 VDF4r011RmVBt2dta8P0bqe8/i5HzBasNDZ6DFKWacPfiFGoP1epxYnDs+BBB+zB9/RRAt+M
 eJ8EXRIxDWFC3VTA9v0fFbIo3e/vnY4ExT7MhdpdKyuQtaBx8u42Pqv9JLNfg5GmCSyYa9oL
 BWxsA7dqtQajZFtJ6s/1hfFuHpFduRZyW92Jl+YghLw6tut8JJ5/ClcpfYs+9RcXanmeqgzU
 KBVAikhP20p68LnsgXOQxGS7XUGSGUWlRRIAwnB7B7kW5r6rzX3uOlg1iSEJMP6Vb86Vyyt4
 KtyVhLmhzoJOyY2/2/LhMNwirlboA+6qBxk34HUeoCVO+Fgca7bYNgXWHBOXsdVVyxGH4O8c
 44CBPcPMOpEs4XwoUYFoB2jDgeuGezv0CdFiHz406I13esvDx/L0gw9Ed0Sv3rZt8n1OaUIX
 Oyp0KXE0zfOYvVL0jn98ojIdRUhrOmCUbJ1cMre1UkvGBnBjlmKqYzlJSma2fgNs2ic8epvS
 /6ghnU5qwF2pjivwMcthpPViYMUxFzP6CJ0wIM0JdKkSE50e9qkHIFQtyGALYR5XsMiQ2Z2u
 Ckk1rILooC7fC8OyJQhxx/TceCIcomR7x/lSe2eLit2imh/d7Kjmxa971KgyuvkW8e60FtHs
 iVLn9fPu34C2BHf9MeKRud/80qixDqCyQDd5+5LL006iafWNoAtzLEsm5cTsUnNETP7lFnog
 aGWaEkp/PWj5ergYrXjvJCcNol0hxnlMqQygMOwHec4Mg8QX2eF4+S82rnj/Ur3QblQkvI2l
 azZvZbHLsoYvq60GwBY34c55xqhDzqr0M4UkWcZIF9FYh6KjYrkN0nMLf37F/uznlShnTVxy
 /zbMLDsAI/BImXdnLrnYL1z8VRTyBApwtBa/59UD7YBL+/tVULpr9zYCwM5MxSzw+b6FNVxz
 oMeVnyLAq+eKK7SvlqI6vs0I+mJeI8VoCvxJ+Q/6/Hyk3A5n0MdfbO03ZsScny3AvVnL12YY
 XrqnNgBDX8HswU/QeDwllGPUT5ea2ysU64i5jw3EoCrAIXbSoComrOB3SO7HpNMZmBBD1CBC
 XLod4SYVPcMci2SJtVtkjweVbe7V4Ah1RautBHkxLV7NefU5CoYtZbl1Nl1/eHciRAz+SRuD
 8uBy2GNU310nmQQSj8swq9/rlZ9xUmY0ahjgvxYEtpT5+hSXwc+NJ7c1PB6C8voVgLFf9eJT
 kumQ9q8DT4sUN0x3ccCY1xhFNW6khDDwy2qDqcOl7yXHpM76abc0GbqKsZjxHbJyrMhg0MlQ
 sRRL22mgLBw9wzJC47OiUWZmL6mdaIH0yHV7meM0XKOvF1EUA53SajJQ2gTaVbVrdT440PPV
 6egB7spPQVf1cCPNq1EZsX0glVDXvjjIsjRbnqplWmpHRiGyauAbJHye2UTxCjTEFEKnRgc8
 3qeLgg+HimhrHreDDNwEVLvZFvh//Fnpn2jQUFnhz2NOlZ93rCx9zYLivGGDfAexLQJvGEms
 TonMky62oecDtuLpwNlOqVGaNg950lK3krHsAh7L9qrPeoq0lsfeAR+uwXuzRx8CoJenMMCs
 nQuyhs0IrDOgwAJTC+RwZ2lYu6fEWL15h36M8br
IronPort-Data: A9a23:CtxKbqs89rBIJ4YylV4HK33/cufnVDJfMUV32f8akzHdYApBsoF/q
 tZmKWHVaPyJM2D1L94jbIiz8xkO6sPXmtU1TwFl/CBjRS0SgMeUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokf0/0rrb/646yEhiMlkf5KkYMbcICd9WAR4fykojBNnioYRj5Vh6TSDK1rlV
 eja/YuHaTdJ5xYuajhIs/3Z9ks21BjPkGpwUmIWNK0jUGD2yCF94KI3fcmZM3b+S49IKe+2L
 86r5K255G7Q4yA2AdqjlLvhGmVSKlIFFVXmZtJ+AsBOszAazsAA+v9T2Mk0NS+7vw60c+VZk
 72hg7TrEFt0Yfec8Agqe0Iw/ylWZcWq8VJcSJS1mZT7I0buKxMAzxjyZa2f0EJxFutfWAlzG
 fIkxD8lMD+bgufxn5eBUMI9vvgHPfDHJblYgyQ1pd3ZJa5OrZHrTKCP/tpExG5owMtDG+rEe
 s9fYigHgBboP0MJYApKTshkwaH32RETcBUBwL6Rja826GjayEpxyrHmMN3Ld9eiW8JRmFfer
 XCuE2HRXk9La43CmWTtHnSEhLLpgjj7AqAuDJqj+sxWiwSV3m08F0hDPbe8ibzj4qKkYPpFJ
 kMO9zE1rK8072SvT8LhRFu8oXiZrlgQVsQ4O/Ym4QuJx4LK7AuDQGsJVDhMbJohrsBeeNAx/
 gPX2Ym0WHo16uDTFi31GqqokA5e8BM9dQcqDRLohyNfizU/iOnfVi7yc+s=
IronPort-HdrOrdr: A9a23:PnOXeamJ/1SyZdGSHHkmsIHPs9HpDfI73DAbv31ZSRFFG/FwWf
 rPoB1p73HJYVEqKRUdcLG7Scy9qBznmKKdjbNhXotKPzOLhILLFutfBOLZqlWKJ8SUzJ8+6U
 4PSclD4ZHLYmRHsQ==
X-Talos-CUID: =?us-ascii?q?9a23=3A7J/eU2tdtBbzolEep6jhWmaG6It7XWXYyTCPBnW?=
 =?us-ascii?q?iIjdRdJmEcHOJwuRdxp8=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3Ag0rE2w7xe4ucfRVm8w9qxqjdxoxqvoKxE0BXs6k?=
 =?us-ascii?q?enNKIBxB7YjGFjRuoF9o=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.09,238,1716242400"; 
   d="scan'208";a="46979586"
Received: from unknown (HELO gm-smtp10.centrum.cz) ([46.255.225.77])
  by antispam34.centrum.cz with ESMTP; 26 Jul 2024 12:36:32 +0200
Received: from [192.168.1.100] (unknown [78.157.137.12])
	by gm-smtp10.centrum.cz (Postfix) with ESMTPA id 9DDC3B8A43;
	Fri, 26 Jul 2024 12:36:32 +0200 (CEST)
Message-ID: <3855f3cf-9c63-4498-853a-d3a0a2f47e7f@volny.cz>
Date: Fri, 26 Jul 2024 12:36:29 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, cs-CZ
To: stable@vger.kernel.org
Cc: regressions@lists.linux.dev
From: "michal.hrachovec@volny.cz" <michal.hrachovec@volny.cz>
Subject: mmap 0-th page
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Good afternoon,

I am trying to allocate the 0-th page with mmap function in my code.
I am always getting this error with this error-code: mmap error ffffffff
Then I was searching the internet for this topic and I have found the 
same topic at stackoverflow web pages.

Here I am sending the link:
https://stackoverflow.com/questions/63790813/allocating-address-zero-on-linux-with-mmap-fails

I was setting value of |/proc/sys/vm/mmap_min_add to zero and using the 
root privileges along the link.
And I am having the same problem still.

Can you help, please.

Thank you for the reply.

Michal Hrachovec

|
