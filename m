Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 416F13206
	for <regressions@lists.linux.dev>; Thu, 14 Jul 2022 11:36:06 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id bp15so2895472ejb.6
        for <regressions@lists.linux.dev>; Thu, 14 Jul 2022 04:36:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gAe7CR3aBt//X7F7s83Xjr80zWOsV9ZSFNF9Ucd5AnE=;
        b=qXgK0PLEfR5/frZuyQG2DX0oaYNO+qypV53s8Ikentorkb9v9QpEXBQyoJ29H4nfsx
         6a+VlSP3jZDfGFgpxYrQL49FNTadjrKjcQqJPwxxTNwX6/AkxFjcmtD80Uw7ZA8vl82d
         QwpeDwmbZ3ed1rn6aoDcVwRrdGOa5WlAUQ7p2YPSFkv1FcNA+7W9bpiZ/Dcz9XbRuuld
         4Zfk4W8ODnbfaW1qple+LP1KQmDVrqIsHbhyp3e4XTIxu4kRaKkouVxKG1II6joZmWCV
         3f6Ln8SGTBQwOxUPgvSdHJA6wIHF7giQT0BxMrSV9G5rwh5vCTNSn9OWuJUEk8ze7nBN
         7qnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gAe7CR3aBt//X7F7s83Xjr80zWOsV9ZSFNF9Ucd5AnE=;
        b=1uoxFFiFpqfIyY/BKBNMZq1NCcWujWoDTX61qMn2bJl+CTcKFm1N4Rbq/jjC+gos6W
         aws8siBKq2kXlS60+tBviyEkAdhMJdBn4P2lRo7N4Ygab46uQcBLuRXv7s4SROwx8wEY
         xOwUxRHkPlLEnJzCQ6muS2q7raUleY0CTYRe0Rz8mHcYcUf53nwUmTDxGBw7TmFkLXti
         WOrzVqHTXjgx4EjlsnN2dHavs5MvKF7wT0TW+Klzy4cF64YK9IbmNnCI68sERrTWY9WW
         C8zBcS9lNwEEtMSVbocPrLqT1Id7L0pSF4jJDl120QTtjq7Pny1vetWrfZKoTfajA89Q
         s6hw==
X-Gm-Message-State: AJIora+OuMclyzazU0KQIzNQLV4edENgl6wWEBwS8bwJamS+w8HZ/N3C
	o71YkFcyParTMjiNDqSjWVPvYqZTPde81URLTtTvHw==
X-Google-Smtp-Source: AGRyM1t033JP7+FCHOjb+QVn2mD96BNzK1O7Aw9VCdtpw/AOPa5UhYHhbP6TiyZsQOPpEjs1eErNp5h0ijuIIE/axKc=
X-Received: by 2002:a17:907:7f1a:b0:726:2b37:7b82 with SMTP id
 qf26-20020a1709077f1a00b007262b377b82mr8167769ejc.366.1657798564434; Thu, 14
 Jul 2022 04:36:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+G9fYuxp2Ge1JGwuXase633r8_7zPZkxrD6doCKi6aYY3mfPw@mail.gmail.com>
 <ca41951e-e662-c4ba-eb78-68ddc77cba2b@arm.com> <20220714082212.GA30886@lst.de>
In-Reply-To: <20220714082212.GA30886@lst.de>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Thu, 14 Jul 2022 17:05:53 +0530
Message-ID: <CA+G9fYvKHDqghKAWy_8MP6+hTXmQqaoTT_STT7v74Oh+G6hKFQ@mail.gmail.com>
Subject: Re: [next] Kernel panic - not syncing: swiotlb_init_remap: nslabs = 0
 too small
To: Christoph Hellwig <hch@lst.de>, Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	lkft-triage@lists.linaro.org, regressions@lists.linux.dev, 
	linux-mm <linux-mm@kvack.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Stephen Rothwell <sfr@canb.auug.org.au>, 
	"open list:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>, Tom Lendacky <thomas.lendacky@amd.com>, 
	conor@kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Robin Murphy <robin.murphy@arm.com>
Content-Type: text/plain; charset="UTF-8"

Hi Christoph and Anshuman,

On Thu, 14 Jul 2022 at 13:52, Christoph Hellwig <hch@lst.de> wrote:
>
> On Thu, Jul 14, 2022 at 01:50:02PM +0530, Anshuman Khandual wrote:
> > 26ffb91fa5e0fb282e8 ("swiotlb: split up the global swiotlb lock")
>
> This has been replace with 20347fca71a387a3751f7bb270062616ddc5317a
> that should fix the issue.

Thanks for your inputs.
As per your suggestion, I have reverted those two patches on Linux next tree
and built for arm64 and the boot test successfully.

467f49f87d84 Revert "swiotlb: split up the global swiotlb lock"
2706e93f7f8a Revert "swiotlb: fail map correctly with failed io_tlb_default_mem"

Boot pass log link,
https://lkft.validation.linaro.org/scheduler/job/5284375#L583

Best Regards
Naresh Kamboju

--
Linaro LKFT
https://lkft.linaro.org
