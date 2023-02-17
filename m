Received: from mail-il1-f177.google.com (mail-il1-f177.google.com [209.85.166.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75C02946A
	for <regressions@lists.linux.dev>; Fri, 17 Feb 2023 21:23:53 +0000 (UTC)
Received: by mail-il1-f177.google.com with SMTP id k15so780288ilv.3
        for <regressions@lists.linux.dev>; Fri, 17 Feb 2023 13:23:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20210112.gappssmtp.com; s=20210112; t=1676669032;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KEMNOuO8+jl8HrgRQYisWklYternUWLl59Yj+DzOu5Y=;
        b=Twm0LBWYpmVFprJhsa+ePCdzTFalANv8TPbn+PtACdxjR5/chuimox7tNJ9gzZPWdm
         Ivnw5TEUlJt2G1IfHauzFT9WJbzgyioPoSSiYpcU3ku4TLBOZ3Dz111VynWhu0CYiKJS
         Gi4aBn1EUyqAwSr1wbxAday4ZSod9vHW6qhWgGJqCXSMDvtLElwbLk0/LarfUbzjetq8
         wBZWP64hrkQ2QLzGD0UHLyfNHk5XHAU237Li2YZhS3x68R8r7JKs91furK9iHagz3H33
         jk83OPSNemuowSXMZDNhAbELVYtTr2pvIEMxJqUZOCvzmXc19x1Ef1URprtdlhoYhiuC
         8btA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1676669032;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KEMNOuO8+jl8HrgRQYisWklYternUWLl59Yj+DzOu5Y=;
        b=PV20e6eyImekFfXt9BAzJoYnBAv8MTcIbtsml5/nT/fu+9N3Cy/Mygo1Q0n9nBug57
         u1Z60hHQG0pGs+uW0MTroGGxa1h3uCVAVMCg9QIDc+xnxI+/Ggl4lb3Hse8GuUZRqY87
         R8nCXW7OjBMZjDWy/L529iyF/AH+4zqzI9mVqHgPIMD5VYRkvB7iUfgwCUZYQlfcBQ1p
         MR4mKoMEjw1yPthk/twf28ZNAJKf4ELDIM4cgQtgFEoHdPUU7kV6dhiYFY86l0Tp7nRG
         nT/IL3k76X+ppnwZkxqipPdW03vaXrl+szYnd/T8i1e35In9SUzj+axc+o41GJ7ldAPL
         tGGw==
X-Gm-Message-State: AO0yUKXdC5sMm+AHRPa+uo2/ZA+GhqOTC7HRnyfP7+eZgEU8zSwfkreC
	dXzsP4KaxOxVMxJOx2G1EFr9Iw==
X-Google-Smtp-Source: AK7set8oK+xWLmt8H/nJcfJrDmqcrK/zK5exSB3Nm35mqoz3QWa1kIcohnyQrqrkiF4nEFngviGyxw==
X-Received: by 2002:a92:1910:0:b0:315:8bf9:53d8 with SMTP id 16-20020a921910000000b003158bf953d8mr3528045ilz.2.1676669032256;
        Fri, 17 Feb 2023 13:23:52 -0800 (PST)
Received: from [192.168.1.94] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id u13-20020a92da8d000000b003154f7c11f7sm1627591iln.39.2023.02.17.13.23.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Feb 2023 13:23:51 -0800 (PST)
Message-ID: <151a00d9-0ea2-eadb-72b4-fa8a2dd41bfc@kernel.dk>
Date: Fri, 17 Feb 2023 14:23:50 -0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
From: Jens Axboe <axboe@kernel.dk>
Subject: Re: [regression] Bug 217037 - cmb attributes missing from the nvme
 class under sysfs
To: Keith Busch <kbusch@kernel.org>
Cc: Linux regressions mailing list <regressions@lists.linux.dev>,
 Jens Axboe <axboe@fb.com>, Christoph Hellwig <hch@lst.de>,
 Sagi Grimberg <sagi@grimberg.me>,
 "linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>,
 LKML <linux-kernel@vger.kernel.org>, michallinuxstuff@gmail.com
References: <52f9afe2-f621-77d8-9d10-449d539e901d@leemhuis.info>
 <Y+5JdR02tlzD/TFS@kbusch-mbp>
Content-Language: en-US
In-Reply-To: <Y+5JdR02tlzD/TFS@kbusch-mbp>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On Thu, Feb 16, 2023 at 8:19 AM Keith Busch <kbusch@kernel.org> wrote:
>
> On Thu, Feb 16, 2023 at 10:28:55AM +0100, Linux regression tracking (Thorsten Leemhuis) wrote:
> > Hi, this is your Linux kernel regression tracker.
> >
> > I noticed a regression report in bugzilla.kernel.org. As many (most?)
> > kernel developer don't keep an eye on it, I decided to forward it by
> > mail. Quoting from https://bugzilla.kernel.org/show_bug.cgi?id=217037 :
> >
> > >  michallinuxstuff@gmail.com 2023-02-14 14:16:26 UTC
> > >
> > > For the CMB-capable nvme ctrls, kernel was exposing couple of related attributes under the sysfs. E.g.
> > >
> > >
> > > # grep . /sys/class/nvme/nvme0/cmb*
> > > /sys/class/nvme/nvme0/cmb:cmbloc : x00000062
> > > /sys/class/nvme/nvme0/cmb:cmbsz  : x0008021d
> > > /sys/class/nvme/nvme0/cmbloc:98
> > > /sys/class/nvme/nvme0/cmbsz:524829
>
> The breakage is that the attributes are decided before we've setup the cmb
> regions. I'll send a fix shortly.

Michael, have you tested this? It's queued up for inclusion, but I don't
see any evidence that this was tested.

-- 
Jens Axboe

