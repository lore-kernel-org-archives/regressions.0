Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B22E317EC
	for <regressions@lists.linux.dev>; Sun, 26 Jun 2022 07:50:11 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id a11-20020a17090acb8b00b001eca0041455so8048221pju.1
        for <regressions@lists.linux.dev>; Sun, 26 Jun 2022 00:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=szddLrd25i6U/qAutufSCQ2QV6OuNtFw/2uiX/jXMh4=;
        b=frQpoe8ICsxbq/MTv7WGnraeh4/TfkGPi93p9PbqfAZdOUPTVZAgoXI797bfdn/YAY
         gJv4b22jjyPMwZk5FZ9H6AJ4rXbxggNwGN2lpDU5fGL+ymKSaJLjGXDKPOfc1H88HTSq
         upljifWvjf70kYZrddeip0InkVoyMNZHHpJkqA6kjbrNmysHSFIp9aLMAi7+MH7Y2d4w
         aEezmHOinJM3MHmJg0YuwIB4fYA1FYSdGp0g9e8/yJRIQQ6Xcvhph71b1IxjE4r2X8hC
         G8PH/+5MWzgcmQ7jA/khhRd7ZoxMKxakz+9ogF05cNP+WcQSivmMk0USE+CkPBQ0CB5A
         gMWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=szddLrd25i6U/qAutufSCQ2QV6OuNtFw/2uiX/jXMh4=;
        b=w/+ADsEC9aqufH2jcYpoP+jUzxj4+sIvv6aHAYMnEJj2kPQ71pbT02HGXZrr4FonnI
         i/6mqL9mBH5Q4iMGixvZb/+K3QvGcbccUfUJDjywZhPrbcNEshIBja6lDDTc/xjmE6tu
         xyxqC2RjrWoVEbMvkUNAjszFmsUgaGIIAfx3UIyrrAZnjKBXjBigfUQ+8Y9Zox6otirr
         Og2VvGIBPqqZ8blX4Nu7xXC3PXd0zTidIS17pcVzHwHMsQzmgkSOjFYxJfixpJAoTw8W
         Mamc0HwAzxw/CwgXK0slPPPNbrRSKW61K0JxaJQOVl+fagtrXm5ca8bXs9xyrztt7Sj1
         r16g==
X-Gm-Message-State: AJIora+nPi9ibj0Nh6+gAX1L8QXAwzXs5/PtY1s7+e0lC18JKuip9PBy
	BaiG1x1KuC4YjqKiIIzSzQwur84QHdaaMVX3a9w=
X-Google-Smtp-Source: AGRyM1tdCN30W9IzWasfH6F+mORtmrDOJWVskcMA9e9OIc6YTzpBZ9LqUTT9Zlx1rEJ4T/seOwPAzC/EHBOxBImVHog=
X-Received: by 2002:a17:902:d5c3:b0:169:672:f897 with SMTP id
 g3-20020a170902d5c300b001690672f897mr8063721plh.71.1656229811096; Sun, 26 Jun
 2022 00:50:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CADs9LoMEF86Fp2-0ji7d9CNA5F=8ArwPWnj09h_Cwo6poNsWVA@mail.gmail.com>
 <YqMdS+3qpYHfWN9f@kroah.com> <CADs9LoMAgCNU6Rx2y0t7kRMmLw-Qd06Ayq19qM2-PkOJUgdxig@mail.gmail.com>
 <Yrc7Z6R4iG26FkmD@kroah.com>
In-Reply-To: <Yrc7Z6R4iG26FkmD@kroah.com>
From: Alex Natalsson <harmoniesworlds@gmail.com>
Date: Sun, 26 Jun 2022 10:49:59 +0300
Message-ID: <CADs9LoNs=r90qtCwgQn2jKnYHCW7WnAWs39G37nbs+8RvpoVBg@mail.gmail.com>
Subject: Re: echo mem > /sys/power/state write error "Device or resource busy"
 on Amlogic A311D device
To: Greg KH <gregkh@linuxfoundation.org>, stable@vger.kernel.org, 
	regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

> A: http://en.wikipedia.org/wiki/Top_post
> Q: Were do I find info about this thing called top-posting?
> A: Because it messes up the order in which people normally read text.
> Q: Why is top-posting such a bad thing?
> A: Top-posting.
> Q: What is the most annoying thing in e-mail?
>
> A: No.
> Q: Should I include quotations after my reply?
>
> http://daringfireball.net/2007/07/on_top
Thanks))


> But this is 5.16.0, the commit you pointed to is in 5.17.
>
I don't understanding why so it... At present  HEAD points to 5.19-rc2...

commit b13baccc3850ca8b8cccbf8ed9912dbaa0fdf7f3 (HEAD, tag: v5.19-rc2)
Author: Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sun Jun 12 16:11:37 2022 -0700

    Linux 5.19-rc2

....but
leha@VIM3 ~/ArchlinuxVIM/linux-git-sound/src/linux $ make kernelrelease
5.16.0-rc1-ARCH+
leha@VIM3 ~/ArchlinuxVIM/linux-git-sound/src/linux $ make kernelversion
5.16.0-rc1
leha@VIM3 ~/ArchlinuxVIM/linux-git-sound/src/linux $ zcat
/proc/config.gz |head -n 5
#
# Automatically generated file; DO NOT EDIT.
# Linux/arm64 5.16.0-rc1 Kernel Configuration
#
CONFIG_CC_VERSION_TEXT="gcc (GCC) 12.1.0"
leha@VIM3 ~/ArchlinuxVIM/linux-git-sound/src/linux $


> Can you send the info to the sound mailing list and cc the developers of
> that commit with your information?  That commit looks odd to be causing
> problems.
OK. I will be to try.
