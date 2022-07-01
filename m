Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07BFD1850
	for <regressions@lists.linux.dev>; Fri,  1 Jul 2022 11:25:45 +0000 (UTC)
Received: by mail-oi1-f173.google.com with SMTP id u199so3189277oie.0
        for <regressions@lists.linux.dev>; Fri, 01 Jul 2022 04:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oc9fPb0L9zIV1NpDh8/6a/qWUDurLbzQWr6Nau5hQcU=;
        b=HJ+BISe//llOb/mXtH9LNBfVblBDN44SRvyGDZrSnmLh6eHWOoqQNmamqxxWOXNqcZ
         mv/bNmfSRqaJbGt7+iPdNutd/5qMmq8TarDrxR4Xd7JdbOMKQIudhG1jSiIp5BPmD001
         aPt3KVBzicwP/DHMW1sE4JGbf0TWFdp7MY3rAOXDqPTQacf5qzfiNdRSYakhC3qXDNLi
         GVsDvJHAH1msCOKG9mUM3caRT/A4Cpj9bCx0riEfmyDkcNmf7E5dlM/tflWDgvOx3cKT
         aD9Y8IyYD8JS2ZpE4StzCaVtWhW73gqLbamnBO54IIaBLoyxg9r/az17amtQf8LwNexC
         9ljQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oc9fPb0L9zIV1NpDh8/6a/qWUDurLbzQWr6Nau5hQcU=;
        b=kb8gJu8lsJK5BrAhdu17wm+vZ1xrnD9cv3msu82RFfpaoC2gzK/3eUp07J2xppi/6a
         1px8zkJyQF4mlCzB8Zbqu8fGoOpb2YMKegakU8KDo/1VSehr+d8Y3VrHfg5/y6cuP5MW
         HGyd+KBQRpmyBQFq1fFSU33n9gh3zEFLFhsNqSLTRaeYHOKeFBl1eECi9GDCQ27V4ILp
         iqtObYotCZmnXiMb+3LWNoVS/D93NGrnDHPkXnjt9Yb7xWoPgASYOmcS82/TLjPv/SoY
         1Npvi0yQN1A0RIp7m5aTFT2ILkHtZHS6dkiRNeeGAp0xvwID2A2kAQ0QiB8IkktKsMzJ
         bgvQ==
X-Gm-Message-State: AJIora80m9Kad6T7J4BKaADzqfJbvBgyERPd24QQUzoSoLE9Uxgr4AE+
	lSLFRt4Crbkh0h3FsWfsgOPyRkGwjN7Z/Oz+3rg=
X-Google-Smtp-Source: AGRyM1vH+nQNxwbQHOFAstUZnhCOEXz1GkaPKSaei28AgYp5XNV3Cu6sb1V0rzXZJmwhYmpDRRWdi60cNG0YDm7f9FQ=
X-Received: by 2002:a54:4688:0:b0:325:9a36:ecfe with SMTP id
 k8-20020a544688000000b003259a36ecfemr8453690oic.96.1656674745160; Fri, 01 Jul
 2022 04:25:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220621233257.GA1342369@bhelgaas> <20220627231810.GA1790539@bhelgaas>
In-Reply-To: <20220627231810.GA1790539@bhelgaas>
From: Jim Quinlan <jim2101024@gmail.com>
Date: Fri, 1 Jul 2022 07:25:33 -0400
Message-ID: <CANCKTBtp+ar-s8NGH_iZz8GHH-smDzXuYrf-9AO44UDBCN3W_A@mail.gmail.com>
Subject: Re: [PATCH 0/4] PCI: brcmstb: Revert subdevice regulator stuff
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Florian Fainelli <f.fainelli@gmail.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, 
	Cyril Brulebois <kibi@debian.org>, Nicolas Saenz Julienne <nsaenz@kernel.org>, 
	bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>, 
	linux-pci <linux-pci@vger.kernel.org>, regressions@lists.linux.dev, 
	Bjorn Helgaas <bhelgaas@google.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, Jun 27, 2022 at 7:18 PM Bjorn Helgaas <helgaas@kernel.org> wrote:
>
> On Tue, Jun 21, 2022 at 06:32:59PM -0500, Bjorn Helgaas wrote:
> > On Tue, Jun 14, 2022 at 02:59:02PM -0400, Jim Quinlan wrote:
> > > ...
> >
> > > The original patchset was and is controversial, as it is basically a
> > > square peg that does not fit nicely into a round Linux hole. It took
> > > 11 versions of following reviewers' suggestions until it was
> > > accepted.  And now it has been reverted, I am wondering if it will
> > > ever be let in ag I also see that the ain or whether I should even try.
> >
> > The original patchset [1] may have been controversial, but that's not
> > the issue here.  The only thing we need to solve here is to post the
> > four patches I reverted with a tiny change to one of them to avoid the
> > regression.  I don't think that should be a problem.
>
> I'll be on vacation until July 7 or 8.  Just a heads-up so you know
> it's not that I'm ignoring anything you may post in the meantime.

Thanks Bjorn, hopefully I will send it today.  At least for me, it's
not so easy to get the latest Linux running
on an RPi w/o running into unrelated  issues.  :-)

Jim Quinlan
Broadcom STB
>
> Bjorn
>
> > [1] https://lore.kernel.org/r/20220106160332.2143-1-jim2101024@gmail.com
