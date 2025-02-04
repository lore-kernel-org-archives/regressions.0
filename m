Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F19ED2153DF
	for <regressions@lists.linux.dev>; Tue,  4 Feb 2025 16:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738685133; cv=none; b=jV67ObMLhAEt3Afj5DchskHGv1QUWm4/M2IsBKwQj71k14Gdr74MqrOJ9/St7x76ISI9tm62vAWWJGXQzwGVBUaA8unJL5HZY1vuH4xG7XXOBP5Sxql6xEHJQ1slkZaQpqI7mNEhWrBUH+tAEei7xWpqOHo20JxrZy7n/2DUpAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738685133; c=relaxed/simple;
	bh=OCx239IGh68nwsquoNZ7VjPkxBUsFQuyTB7CSMQBMNo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=osat1/GLnkiSiPQly5SU7hV1bFeCQ1Br10ytyi+xEqx2lr4Wy7CZVcxuTNyff52FcH8S4gZzJwhhD6Xpmq3W/ILFeqU2yPpnTB/z1THgcatNi12FzwqKmxliagzt6eXfBJrAFCTkKlyebYW47HSyfEm9zWmYJzjTvggh09dsUgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r33CR2ly; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r33CR2ly"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60A2EC4CEE5
	for <regressions@lists.linux.dev>; Tue,  4 Feb 2025 16:05:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738685132;
	bh=OCx239IGh68nwsquoNZ7VjPkxBUsFQuyTB7CSMQBMNo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=r33CR2lybrTsdcDjY2Xw8XQ3gcwWucNtBSS+XOjyrQuR1N+mK34QExRJdtssGX7BA
	 Izb7c1m3BKqVsIWPOfeyWXVP5IxibkUOpd87E6jWl5CRVY03rZW9EfJ3jR/fro/0R4
	 c7UAqzIpyjRYyLUisytVm4PdYoDSgti/KGG0Q2LRrxr5timppb5OPMAo8z6l9OqpHt
	 T/cPrEIAoQOtzuh2PQKmUKIjNDRkO5EwV1D/m9orm7JLJiNN7CcH362o8R3Mi2kf/o
	 f5s41IijR27VnLEiQbdE91ry0gfB4xySi1Mm8/BsW/br+RcG3d0rLGsFzg4IAY5ik7
	 RZxr7JCnmKo0g==
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-71e15d9629bso1636137a34.1
        for <regressions@lists.linux.dev>; Tue, 04 Feb 2025 08:05:32 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWo8by3iUuiVipvOhZi5Hkaahy3SpKPaL4dO/qnNfn7E1UJPFAvGqvW+oVt+ld0+8DdU2/F1WSw+rEO8g==@lists.linux.dev
X-Gm-Message-State: AOJu0YyK77GPkPukJ48XQPQLb8DX06hBdPm4WtY0XUlZHTXJi4Doe1ic
	cyrlqL/Do4ft0GBfHIsRYE3QTcLM8DXc8Kb7nLFhlFen3DyywGywuTaaAmzpbBv5fGsd4jMvr4d
	lCi0UvVQMEiYtAFVejk8e8Uy38fU=
X-Google-Smtp-Source: AGHT+IEsZ2eZgax5bljmcu3QeYpQBxJJGuPrxmGrR5IsY/dDc66Wpzviavvj+rsdVsXuSy4TnbvsrwkvidUyThA+nyc=
X-Received: by 2002:a05:6830:7309:b0:718:615:462d with SMTP id
 46e09a7af769-72656781c5amr17940139a34.13.1738685131592; Tue, 04 Feb 2025
 08:05:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAJZ5v0iKmynOQ5vKSQbg1J_FmavwZE-nRONovOZ0mpMVauheWg@mail.gmail.com>
 <CAJZ5v0i=yBSFW82E=s=mx7ztVzmnoUwbxkDRnYyDztAWK9VcsQ@mail.gmail.com>
 <9aa469fd-da5b-70fc-147e-dd4a50cf5af6@linux.intel.com> <CAJZ5v0j157A=v6S8X4+QXRrmUfk2uN5DkRJ5RXd4e4o3hVucqg@mail.gmail.com>
 <f903a3fb-5f5a-0bc9-92cf-34d151d234dc@linux.intel.com>
In-Reply-To: <f903a3fb-5f5a-0bc9-92cf-34d151d234dc@linux.intel.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Tue, 4 Feb 2025 17:05:20 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0gq2Nm18ChtXn09cv-jDA9JU9jRtuSOU=Q_j3+p-Z87Tw@mail.gmail.com>
X-Gm-Features: AWEUYZk0DdoO7j37JzSu40CQglN7fLNs5fT4Y7EUBV2Hvue3yyNBtbBcOGUsy58
Message-ID: <CAJZ5v0gq2Nm18ChtXn09cv-jDA9JU9jRtuSOU=Q_j3+p-Z87Tw@mail.gmail.com>
Subject: Re: [Regression in 6.14-rc1] System suspend/resume broken by PCI
 commit 1db806ec06b7c
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Jian-Hong Pan <jhp@endlessos.org>, Linux PCI <linux-pci@vger.kernel.org>, 
	Linux PM <linux-pm@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	"Thorsten Leemhuis (regressions address)" <regressions@leemhuis.info>, 
	Linux regressions mailing list <regressions@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 4, 2025 at 4:54=E2=80=AFPM Ilpo J=C3=A4rvinen
<ilpo.jarvinen@linux.intel.com> wrote:
>
> On Tue, 4 Feb 2025, Rafael J. Wysocki wrote:
>
> > Hi Ilpo,
> >
> > On Tue, Feb 4, 2025 at 8:48=E2=80=AFAM Ilpo J=C3=A4rvinen
> > <ilpo.jarvinen@linux.intel.com> wrote:
> > >
> > > On Mon, 3 Feb 2025, Rafael J. Wysocki wrote:
> > >
> > > > On Mon, Feb 3, 2025 at 9:12=E2=80=AFPM Rafael J. Wysocki <rafael@ke=
rnel.org> wrote:
> > > > >
> > > > > Hi,
> > >
> > > Hi Rafael,
> > >
> > > > > The following commit:
> > > > >
> > > > > commit 1db806ec06b7c6e08e8af57088da067963ddf117
> > > > > Author: Jian-Hong Pan <jhp@endlessos.org>
> > > > > Date:   Fri Nov 15 15:22:02 2024 +0800
> > > > >
> > > > >    PCI/ASPM: Save parent L1SS config in pci_save_aspm_l1ss_state(=
)
> > > > >
> > > > >    After 17423360a27a ("PCI/ASPM: Save L1 PM Substates Capability=
 for
> > > > >    suspend/resume"), pci_save_aspm_l1ss_state(dev) saves the L1SS=
 state for
> > > > >    "dev", and pci_restore_aspm_l1ss_state(dev) restores the state=
 for both
> > > > >    "dev" and its parent.
> > > > >
> > > > >    The problem is that unless pci_save_state() has been used in s=
ome other
> > > > >    path and has already saved the parent L1SS state, we will rest=
ore junk to
> > > > >    the parent, which means the L1 Substates likely won't work cor=
rectly.
> > > > >
> > > > >    Save the L1SS config for both the device and its parent in
> > > > >    pci_save_aspm_l1ss_state().  When restoring, we need both beca=
use L1SS must
> > > > >    be enabled at the parent (the Downstream Port) before being en=
abled at the
> > > > >    child (the Upstream Port).
> > > > >
> > > > >    Link: https://lore.kernel.org/r/20241115072200.37509-3-jhp@end=
lessos.org
> > > > >    Fixes: 17423360a27a ("PCI/ASPM: Save L1 PM Substates Capabilit=
y for
> > > > > suspend/resume")
> > > > >    Closes: https://bugzilla.kernel.org/show_bug.cgi?id=3D218394
> > > > >    Suggested-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.co=
m>
> > > > >    Signed-off-by: Jian-Hong Pan <jhp@endlessos.org>
> > > > >    [bhelgaas: parallel save/restore structure, simplify commit lo=
g, patch at
> > > > >    https://lore.kernel.org/r/20241212230340.GA3267194@bhelgaas]
> > > > >    Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
> > > > >    Tested-by: Jian-Hong Pan <jhp@endlessos.org> # Asus B1400CEAE
> > > > >
> > > > > broke system suspend/resume on my Dell XPS13 9360.  It doesn't ev=
en
> > > > > pass suspend/resume testing after "echo devices > /sys/power/pm_t=
est".
> > > > >
> > > > > It looks like PCIe links are all down during resume after the abo=
ve
> > > > > commit, but it is rather hard to collect any data in that state.
> > > > >
> > > > > Reverting the above commit on top of 6.14-rc1 makes things work a=
gain,
> > > > > no problem.
> > > > >
> > > > > I'm unsure what exactly the problem is ATM, but I'm going to chec=
k a
> > > > > couple of theories.
> > > >
> > > > The attached change makes it work again, FWIW, but moving the
> > > > parent->l1ss check alone below the pdev l1ss saving doesn't help.
> > > >
> > > > So it is either the parent check against NULL or the
> > > > pcie_downstream_port(pdev) one that breaks it.  I guess the former,
> > > > but I'll test it tomorrow.
> > >
> > > Neither of those is the root cause
> >
> > Well, not quite.
> >
> > > but it's bit hard to see from the code
> > > itself because the parent->saved_state check your test patch also rem=
oved
> >
> > My patch hasn't removed that check.
>
> Ah, I'm sorry, I read too quickly and assumed the first checks were just
> moved to where the parent->state_saved check is, replacing it.
>
> > Besides, suspend/resume works on my system without commit
> > 1db806ec06b7c6e0 and the parent->saved_state only affects the parent,
> > so it clearly cannot be the culprit here.
> >
> > > looks very logical on a glance (but that's the problematic line).
> > >
> > > The fix is already here with the explanation:
> > >
> > > https://lore.kernel.org/linux-pci/20250131152913.2507-1-ilpo.jarvinen=
@linux.intel.com/T/#u
> >
> > So it turns out that the minimum fux that works here is what I posted.
> > That is, the upfront pcie_downstream_port(pdev) check needs to be
> > dropped and the !parent check needs to be moved after saving the
> > pdev's state.
> >
> > IOW, it looks like on this platform, it is necessary to save the l1ss
> > state for a Root Port.
>
> The restore side, though, does also contains that pcie_downstream_port()
> so nothing would be restored.
>
> Could a downstream component attempt to restore L1SS config while never
> having called the save beforehand? In such case your patch would make som=
e
> meaningful difference which could explain the outcome.

Interestingly enough, removing the parent->saved_state check alone
does help too.

What appears to happen is that after adding the upfront
pcie_downstream_port(pdev) and !parent checks, it is now necessary to
save the L1SS state of the parent along the L1SS state of the child,
because it will not be saved otherwise.

I'm assuming that the fix mentioned above is on its way to the
mainline, so problem solved.

Thanks!
