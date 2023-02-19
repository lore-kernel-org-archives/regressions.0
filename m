Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B1F965B
	for <regressions@lists.linux.dev>; Sun, 19 Feb 2023 22:54:49 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id ko13so74063plb.13
        for <regressions@lists.linux.dev>; Sun, 19 Feb 2023 14:54:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dq60iPwMT9YyeuZYyBaeVXOCLyMD+LIZs+7sJUezDZU=;
        b=NZYxQ1+X02jZEYiaJJ0FEnR/k09pMGRnpL3WRKgxjY6VkopET8Pl1CsQTko02lD8yj
         HQSoD1Pkg26h3qdJvpRbyfl965FaQfcULt8lYHCNmVx2v+U29mXO7UcsE3q2+gF/rhP5
         wFYNuAmlMe/mCOOHD4HACmSCUNBZx6h6beDZu5LqD3GazOseUVpeN7zkVuIIQzChoItZ
         WnBDtK2BDNhVpkwIRJBEi4j2hw5zcoiaanvs+2rl/7Q6ecpPU9vHA3uLxnrxj52uKpfZ
         4n9IdSLdprAsyBO/gLc6822eWwciBp60bsJVPfjHpjz3oU0xAZIKk+EDJYxihW8EeO93
         Ls7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dq60iPwMT9YyeuZYyBaeVXOCLyMD+LIZs+7sJUezDZU=;
        b=lrw4QyXyanxtlU0AbTUquoBGdjpojEzPFW3fnBkxSQtvsYlG+4oGxH6/WWG1iyN36o
         B4UW14wcG5QBNrIR7P4sffl/ZshKOsvP200/pjJLG2tmOfNvQt5PCkOnDyNdPw69QCiu
         a1kMOFRQflrmifAqxyaxcjllceCZCWLu2TEIhyqhqRQuw6NjSJ8Ao08PdynwWu12i66t
         XsmoQPizVaxao0tYazMPUYQo7WiyoFI7lUm09VUhYDUOxvlGUh9a8lH/I0vd87nohAdL
         UksD3Ed1pD0bdS3C6JUx2jkUByJvay8olBHQFxPA/VQjqrmLtpCUYVQBRhfmPLlsSldA
         H+tA==
X-Gm-Message-State: AO0yUKU+mMy1Dah4+W0Bczmb6w50bdmLHKnR1zo8qAyJvc6owSrVC3Kb
	OT6259SMB3oyxTX4hsgDlLPLI0LvQw8uvo5Xzms=
X-Google-Smtp-Source: AK7set+kG+DUmbdPiJsfJTmx5/zd26OJWhuaT2epIMVOS6lpWkQvJxPNa1l7k/ybyAmYhUoo3ImINDAItkhm0F2qDbA=
X-Received: by 2002:a17:90b:2643:b0:232:d23a:8314 with SMTP id
 pa3-20020a17090b264300b00232d23a8314mr809903pjb.96.1676847288595; Sun, 19 Feb
 2023 14:54:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <52f9afe2-f621-77d8-9d10-449d539e901d@leemhuis.info>
 <Y+5JdR02tlzD/TFS@kbusch-mbp> <151a00d9-0ea2-eadb-72b4-fa8a2dd41bfc@kernel.dk>
In-Reply-To: <151a00d9-0ea2-eadb-72b4-fa8a2dd41bfc@kernel.dk>
From: Michal Berger <michallinuxstuff@gmail.com>
Date: Sun, 19 Feb 2023 23:54:37 +0100
Message-ID: <CACosJgyjgh+cz6nTrKWVQ9P8Z9_wJGWGQBOjae2MoJrZQ3RmTQ@mail.gmail.com>
Subject: Re: [regression] Bug 217037 - cmb attributes missing from the nvme
 class under sysfs
To: Jens Axboe <axboe@kernel.dk>
Cc: Keith Busch <kbusch@kernel.org>, 
	Linux regressions mailing list <regressions@lists.linux.dev>, Jens Axboe <axboe@fb.com>, 
	Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>, 
	"linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Have there been any patches submitted for testing? I don't see any as
part of this thread nor at the bugzilla where the issue was initially
reported. :)

Regards,
Michal


pt., 17 lut 2023 o 22:23 Jens Axboe <axboe@kernel.dk> napisa=C5=82(a):
>
> On Thu, Feb 16, 2023 at 8:19 AM Keith Busch <kbusch@kernel.org> wrote:
> >
> > On Thu, Feb 16, 2023 at 10:28:55AM +0100, Linux regression tracking (Th=
orsten Leemhuis) wrote:
> > > Hi, this is your Linux kernel regression tracker.
> > >
> > > I noticed a regression report in bugzilla.kernel.org. As many (most?)
> > > kernel developer don't keep an eye on it, I decided to forward it by
> > > mail. Quoting from https://bugzilla.kernel.org/show_bug.cgi?id=3D2170=
37 :
> > >
> > > >  michallinuxstuff@gmail.com 2023-02-14 14:16:26 UTC
> > > >
> > > > For the CMB-capable nvme ctrls, kernel was exposing couple of relat=
ed attributes under the sysfs. E.g.
> > > >
> > > >
> > > > # grep . /sys/class/nvme/nvme0/cmb*
> > > > /sys/class/nvme/nvme0/cmb:cmbloc : x00000062
> > > > /sys/class/nvme/nvme0/cmb:cmbsz  : x0008021d
> > > > /sys/class/nvme/nvme0/cmbloc:98
> > > > /sys/class/nvme/nvme0/cmbsz:524829
> >
> > The breakage is that the attributes are decided before we've setup the =
cmb
> > regions. I'll send a fix shortly.
>
> Michael, have you tested this? It's queued up for inclusion, but I don't
> see any evidence that this was tested.
>
> --
> Jens Axboe
>
