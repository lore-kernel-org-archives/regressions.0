Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE02828F2
	for <regressions@lists.linux.dev>; Thu, 29 Jun 2023 08:49:59 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20230629084952euoutp02c3ef68e6a430334665aed3a37c85dcf3~tFQ_pKGPB1358713587euoutp02p
	for <regressions@lists.linux.dev>; Thu, 29 Jun 2023 08:49:52 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20230629084952euoutp02c3ef68e6a430334665aed3a37c85dcf3~tFQ_pKGPB1358713587euoutp02p
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1688028592;
	bh=RCJMfhNOhoNuhYOW2LQFchciQR63q/vY6yCZF5AfVcU=;
	h=Date:Subject:To:CC:From:In-Reply-To:References:From;
	b=FmSjSyGEHso/yo6Uxq0rlRB7kJHu8J4zEe1cLRyovgrN6DdcF7NcdK3klfqwZBmR7
	 mEUVVZpV3FoVaD8HDh+kHWv6TJCnVeRFEmfGn4oX7m2hSkx3e2IwQ0ARAbm0Hob3o5
	 LHXDSeSjHnphvD31mKyZONkBI2QzkgcRU8TtFqsk=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTP id
	20230629084951eucas1p2e1472437ce36e6e154e846bbb21ab6c1~tFQ_Edg9s0633506335eucas1p2n;
	Thu, 29 Jun 2023 08:49:51 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
	eusmges3new.samsung.com (EUCPMTA) with SMTP id E5.39.37758.FA54D946; Thu, 29
	Jun 2023 09:49:51 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20230629084951eucas1p215f9041ba59fdd1c9538f472edc541e7~tFQ9s9w9b0769007690eucas1p2K;
	Thu, 29 Jun 2023 08:49:51 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
	eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20230629084951eusmtrp156abfc34d22bc1ceaef08aa98e5e94b6~tFQ9sUMQV1924919249eusmtrp1H;
	Thu, 29 Jun 2023 08:49:51 +0000 (GMT)
X-AuditID: cbfec7f5-7ffff7000002937e-5f-649d45afc034
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
	eusmgms2.samsung.com (EUCPMTA) with SMTP id 5D.68.14344.FA54D946; Thu, 29
	Jun 2023 09:49:51 +0100 (BST)
Received: from CAMSVWEXC02.scsc.local (unknown [106.1.227.72]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20230629084951eusmtip23cfd8f2ec4ec9553393061e5f521c9fd~tFQ9bfIbx1475314753eusmtip2F;
	Thu, 29 Jun 2023 08:49:51 +0000 (GMT)
Received: from [192.168.8.190] (106.210.248.115) by CAMSVWEXC02.scsc.local
	(2002:6a01:e348::6a01:e348) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
	Thu, 29 Jun 2023 09:49:46 +0100
Message-ID: <1d1a37ff-ba69-88a2-f775-c6878e88046b@samsung.com>
Date: Thu, 29 Jun 2023 10:49:46 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
	Thunderbird/102.11.0
Subject: Re: Fwd: Need NVME QUIRK BOGUS for SAMSUNG MZ1WV480HCGL-000MV
 (Samsung SM-953 Datacenter SSD)
To: Keith Busch <kbusch@kernel.org>, Bagas Sanjaya <bagasdotme@gmail.com>
CC: Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>, "Sagi
 Grimberg" <sagi@grimberg.me>, Clemens S. <cspringsguth@gmail.com>, "Martin
 Belanger" <martin.belanger@dell.com>, Chaitanya Kulkarni <kch@nvidia.com>,
	John Meneghini <jmeneghi@redhat.com>, Hannes Reinecke <hare@suse.de>, "Linux
 Kernel Mailing List" <linux-kernel@vger.kernel.org>, Linux Regressions
	<regressions@lists.linux.dev>, Linux NVMe <linux-nvme@lists.infradead.org>,
	Kanchan Joshi <joshi.k@samsung.com>, Javier Gonzalez
	<javier.gonz@samsung.com>
Content-Language: en-US
From: Pankaj Raghav <p.raghav@samsung.com>
In-Reply-To: <ZJsKBkPqoWzYyngS@kbusch-mbp.dhcp.thefacebook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [106.210.248.115]
X-ClientProxiedBy: CAMSVWEXC01.scsc.local (2002:6a01:e347::6a01:e347) To
	CAMSVWEXC02.scsc.local (2002:6a01:e348::6a01:e348)
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrHKsWRmVeSWpSXmKPExsWy7djPc7rrXeemGJw8pWGx+m4/m8XURkaL
	Nzt3sVvsWTSJyWLl6qNMFqsvrGeymHToGqPF06uzmCwu75rDZjF/2VN2i3OzlrBYbHzbwW6x
	7vV7Fgdej0kzZzB77Jx1l93j/L2NLB6Xz5Z6bFrVyeaxeUm9x4vNMxk9dt9sYPPobX7H5vF+
	31Wg+Olqj8+b5AJ4orhsUlJzMstSi/TtErgytn9bwlrwiKPi/JTTjA2M09m7GDk5JARMJFYt
	PcDSxcjFISSwglHi+fSPUM4XRon1V6+wQTifGSW+7doA17Jg8TGoquWMEj0LpjHDVfX/ucUE
	4exmlPi1eSozSAuvgJ3EraOfWEBsFgFViadvFrNDxAUlTs58AhYXFYiWaF12nw3EFhbIkNj/
	6QJYr4iAp8Tu2SvB1jELzGKR2DRlMViCWUBc4taT+UDbODjYBLQkGjvBZnIK2EvMv3meCaJE
	U6J1+292CFteYvvbOcwQLyhLXJjzmg3CrpU4tQXiaAmBe5wSf+7/hfrTReL8mk2MELawxKvj
	W6DiMhKnJ/ewQNjVEk9v/GaGaG4Ben/nejaQgyQErCX6zuRA1DhK7N63kREizCdx460gxD18
	EpO2TWeewKg6CykoZiH5bBaSF2YheWEBI8sqRvHU0uLc9NRi47zUcr3ixNzi0rx0veT83E2M
	wCR4+t/xrzsYV7z6qHeIkYmD8RCjBAezkgjv7TezU4R4UxIrq1KL8uOLSnNSiw8xSnOwKInz
	atueTBYSSE8sSc1OTS1ILYLJMnFwSjUwtfOp3p29WPV6X8yjvoAte6pcOJ/rBnqLbSm9tSlJ
	77XuJm7nbVGnX9gY+x1LaDqznj26YUPF4jOPqp2+vg7abOkRrhM/aaZZv87f/bzuMxUWqCjf
	7YqM/pOrwrZh94srNXOPL81bX20WvPrE6Yln8u9cN7getSbQhFH6XlngA83wHhXOzmoZhV/P
	lVl2BCzh4U3cFCTAsOzR73uVJgt2WKuJZidklJ2+H3U76fJ2vYYML7656u4T+cp9d80Xl+PZ
	cvfsZFGjpRrvTn/wst2Rt2mf1rScmXPfP8uZPk96krVFoCZj4nt7gQj7KX/ae1tvS99IOJL7
	VftnfmWtuUdmT7vVz/JP75MWW1voGbkqsRRnJBpqMRcVJwIAuuMep/EDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprMKsWRmVeSWpSXmKPExsVy+t/xe7rrXeemGNz7xG2x+m4/m8XURkaL
	Nzt3sVvsWTSJyWLl6qNMFqsvrGeymHToGqPF06uzmCwu75rDZjF/2VN2i3OzlrBYbHzbwW6x
	7vV7Fgdej0kzZzB77Jx1l93j/L2NLB6Xz5Z6bFrVyeaxeUm9x4vNMxk9dt9sYPPobX7H5vF+
	31Wg+Olqj8+b5AJ4ovRsivJLS1IVMvKLS2yVog0tjPQMLS30jEws9QyNzWOtjEyV9O1sUlJz
	MstSi/TtEvQytn9bwlrwiKPi/JTTjA2M09m7GDk5JARMJBYsPsbSxcjFISSwlFFi+8H5UAkZ
	iY1frrJC2MISf651sUEUfWSU+HPnGTOEs5tRYtnW/4wgVbwCdhK3jn5iAbFZBFQlnr5ZzA4R
	F5Q4OfMJWFxUIFpi9ecLYFOFBTIk9n+6wAxiiwh4SuyevRLsDGaBWSwSm6YshtpwlFFi/6Nr
	YB3MAuISt57MZ+pi5OBgE9CSaOwEW8ApYC8x/+Z5JogSTYnW7b/ZIWx5ie1v5zBDvKAscWHO
	azYIu1bi899njBMYRWchuW8Wkg2zkIyahWTUAkaWVYwiqaXFuem5xUZ6xYm5xaV56XrJ+bmb
	GIGpY9uxn1t2MK589VHvECMTB+MhRgkOZiUR3ttvZqcI8aYkVlalFuXHF5XmpBYfYjQFBtJE
	ZinR5Hxg8soriTc0MzA1NDGzNDC1NDNWEuf1LOhIFBJITyxJzU5NLUgtgulj4uCUamAK+ZVQ
	GyqnxrA/Z+GLuPr5Ft8ja+/qq1x0ZmGe2XN5n3HuxFSplbdlj0Z8UQk5sqZdke3t+2gj669F
	uzqyuR2XLZmnEfCVr8b1ZLnCoXaOOzv5PV6+6q952hP/+2BOoOOdVymTXIqm1AWVS7+QK2n6
	vT/hWMXRnjUPtb9ozOxfd0z/3qf+BPbHMw4kb15UuvXSzADrBZPENT/vaVlvFpV09kSn8Qwe
	FzdxMeu7OlPjDk9t7dy+8OF51teaEyQz7Ven3Z1fU34zfzffyd/q0y1XlUuzKF235Zs8RWBF
	YOvlO33OP1+r72tgVVfWCAw3Lklf1Ww64adG6bFdmR+nF688nXqYvT11p2Hkm5IkTkUlluKM
	REMt5qLiRABw/OprpgMAAA==
X-CMS-MailID: 20230629084951eucas1p215f9041ba59fdd1c9538f472edc541e7
X-Msg-Generator: CA
X-RootMTR: 20230627161055eucas1p18d097cbcc2215b292c65a5b3a0f0e6b5
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20230627161055eucas1p18d097cbcc2215b292c65a5b3a0f0e6b5
References: <d18d2a08-9d24-0209-c2cf-baf60bbf5048@gmail.com>
	<CGME20230627161055eucas1p18d097cbcc2215b292c65a5b3a0f0e6b5@eucas1p1.samsung.com>
	<ZJsKBkPqoWzYyngS@kbusch-mbp.dhcp.thefacebook.com>

Thanks for forwarding the report, Keith!

On 2023-06-27 18:10, Keith Busch wrote:
> On Mon, Jun 26, 2023 at 08:15:49AM +0700, Bagas Sanjaya wrote:
>> See Bugzilla for the full thread.
>>
>> The reporter had a quirk (see above) that fixed this regression,
>> nevertheless I'm adding it to regzbot to make sure it doesn't fall
>> through cracks unnoticed:
>>
>> #regzbot introduced: 86c2457a8e8112f https://bugzilla.kernel.org/show_bug.cgi?id=217593
>> #regzbot title: NVME_QUIRK_BOGUS_NID is needed for SAMSUNG MZ1WV480HCGL-000MV
> 
> These bug reports really should go to the vendors that created the
> broken device with non-unique "unique" fields. It's easy enough for me
> to write the quirk patch, but it's not the ideal solution and may harm
> devices/firmwares with the same VID:DID that don't have this problem.
> Not being the vendor, I'm not in a postition to know that, so CC'ing
> some Samsung folks.

I will forward this report internally. Usually the Datacenter SSDs firmware
are created based on customer requirements, so please wait before applying these
changes.

Regards,
Pankaj
