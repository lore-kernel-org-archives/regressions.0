Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE1464C72
	for <regressions@lists.linux.dev>; Wed, 21 Sep 2022 16:15:32 +0000 (UTC)
Received: by mail-ot1-f41.google.com with SMTP id l7-20020a056830154700b0065563d564dfso4320399otp.0
        for <regressions@lists.linux.dev>; Wed, 21 Sep 2022 09:15:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=nho4Mx1okgWawVlTzUYe67i9YWynaM+oXQaK+2MMuvI=;
        b=VwqCvKnPJ7HggbwxjUkIkIQa8H/b7PRW5aOthoIKPKSz1DK+gLZjQ6BW4nlT6EaaVo
         FQTCFBHAgsK3r9PXjfda17cDQYAzny1+jxbYFIKGrPqDUy5vTb8wIgXRTWmeXA0g556q
         rCYCPmFCWZOzbBCa0bTpi8Ecw8GT/IUH8FkWw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=nho4Mx1okgWawVlTzUYe67i9YWynaM+oXQaK+2MMuvI=;
        b=kpsrYlDaAi4OsX5aBSswO1ir6SCHMAvGa9XjqyBBaZ3eWYbN8dvSBkN7SUoxkhvAuR
         L/JQqhgOLwcrHCjeJgaop4wB72a9VaA+g36FZbgOHsJy3dj9hgmPauiqTmGlLYGPCd+H
         /3W0xdApXLcyqEx8A2E38x0gHvP0U02xlXbYd+2y39yZRPH5Y/CMaZvYLtMPueXYf/In
         hX4V2BKmKJIc+27My1oE2uBThUh8FDtWafKUcU3DQ14j7UtrJmQe/jfil2rOapL7Xln7
         ZL9LS1itQ7vDh5XbZHsE4NvEwML9tPrTa8kslcupr8VsvM/hCWzjDwzc84UnozLE1UvN
         VcAg==
X-Gm-Message-State: ACrzQf2X/MXMElmZrdPpXl6ZsSwBq9T5XR+g44dt+ta6Eg23ctaiKxkM
	CH5QeNhrCitb6ABuDF4cdCHeuQY+oIKKeA==
X-Google-Smtp-Source: AMsMyM79o7Iiz2mIwIv8A/5cQ30a3aOzjLRMHMqBG+/1UipEd0R9dGEXAR9AjFN4WrJ2LObOFKo6Cw==
X-Received: by 2002:a05:6830:1691:b0:659:e769:2d8f with SMTP id k17-20020a056830169100b00659e7692d8fmr11426648otr.369.1663776931572;
        Wed, 21 Sep 2022 09:15:31 -0700 (PDT)
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com. [209.85.167.174])
        by smtp.gmail.com with ESMTPSA id o10-20020a056871078a00b0012b2b0b6281sm1760900oap.9.2022.09.21.09.15.29
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Sep 2022 09:15:29 -0700 (PDT)
Received: by mail-oi1-f174.google.com with SMTP id v130so8695968oie.2
        for <regressions@lists.linux.dev>; Wed, 21 Sep 2022 09:15:29 -0700 (PDT)
X-Received: by 2002:a05:6808:11cf:b0:34b:8f4f:314b with SMTP id
 p15-20020a05680811cf00b0034b8f4f314bmr4277924oiv.126.1663776928733; Wed, 21
 Sep 2022 09:15:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <1d1844f0-c773-6222-36c6-862e14f6020d@leemhuis.info>
 <fd672632-7935-14ff-e2be-0db8443b0907@leemhuis.info> <YyrI/qzx/EWapzck@8bytes.org>
In-Reply-To: <YyrI/qzx/EWapzck@8bytes.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 21 Sep 2022 09:15:12 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgU0PyYHut+8zV+kNCxOZiCXd5J29Eisiy8badzsk8Msw@mail.gmail.com>
Message-ID: <CAHk-=wgU0PyYHut+8zV+kNCxOZiCXd5J29Eisiy8badzsk8Msw@mail.gmail.com>
Subject: Re: How to quickly resolve the IOMMU regression that currently
 plagues a lot of people in 5.19.y
To: Joerg Roedel <joro@8bytes.org>
Cc: Thorsten Leemhuis <regressions@leemhuis.info>, Greg KH <gregkh@linuxfoundation.org>, 
	Lu Baolu <baolu.lu@linux.intel.com>, iommu@lists.linux.dev, 
	"stable@vger.kernel.org" <stable@vger.kernel.org>, 
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>, LKML <linux-kernel@vger.kernel.org>, 
	Sasha Levin <sashal@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 21, 2022 at 1:19 AM Joerg Roedel <joro@8bytes.org> wrote:
>
> Thanks for the noise :) I will queue the fix today and send it upstream.

.. and it's in my tree now.

                  Linus
