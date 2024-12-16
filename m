Received: from mail-0301.mail-europe.com (mail-0301.mail-europe.com [188.165.51.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73CF61D45EF
	for <regressions@lists.linux.dev>; Mon, 16 Dec 2024 20:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.165.51.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734381640; cv=none; b=E/YsKkfYGQdPtZXL0OQtJk3UZYxv5Qjs68WnP3fI/3p4KS99jVbkI66qKQMMK6oxTQT299It2nVvhH6AiyhRrVayXaEip9jpmnRFy7ajdmvSSh+nIpY5cpC5rsEv6fQzD/F7RcEA3zxslJS166PDVg3u0gYlnaOcUfI/nr7cUIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734381640; c=relaxed/simple;
	bh=RU5BkYL8V+CfpqXLSJHZSHYMYQl+nYMNgsff/LFSdbc=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=I7uhg3R7J9cm90LWABh7loNk7P+Jzay8hgYr1D9lKGlnRd4yqn0/qVfX0yWn5gCcBKCj4YDJfNRpqwizqkrpndJiBg5NhGT3xOZVChz4ZZBayPxvYChK2/sk12+mPI90Y9h5e2PRG5z26dKwWv3qQ3ocod9R4d44Z1AOvclXTHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ranguvar.io; spf=pass smtp.mailfrom=ranguvar.io; dkim=pass (2048-bit key) header.d=ranguvar.io header.i=@ranguvar.io header.b=Da7rTmwE; arc=none smtp.client-ip=188.165.51.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ranguvar.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ranguvar.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ranguvar.io header.i=@ranguvar.io header.b="Da7rTmwE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ranguvar.io;
	s=protonmail3; t=1734381622; x=1734640822;
	bh=RU5BkYL8V+CfpqXLSJHZSHYMYQl+nYMNgsff/LFSdbc=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=Da7rTmwEKuJc5arr9F/4ctWbg6jnlkvCmVxAp+eab9pr1SV1T8FXa6d7GYhSmeJpV
	 LMhpbI4wvnaZdAapRke5wnLacgIeSzQ4gSuSNtGhiVoJFuZ8WqPaSvnqdV7DTGJPZ2
	 cIueUHs5BgMCEsrySs/frTWKVAFwhZVJSZ0nAGog2UTatYR8N8RRtMKIvvXlPczxET
	 X45y+TZkKZZBfbITuSLoTQjTRxKxCxFZLqq2IWG45Rdw1ohXCDK0syY+ORR1QlLIdF
	 uNLDQSC0mPlZLWqNoKiBhpB0/OC8AhPu7S0431TiyU0959DxdWloHC/e/O3o6A2PZG
	 OZDJAOaFfp8ZQ==
Date: Mon, 16 Dec 2024 20:40:18 +0000
To: Sean Christopherson <seanjc@google.com>
From: Ranguvar <ranguvar@ranguvar.io>
Cc: Juri Lelli <juri.lelli@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@gmail.com>, "regressions@lists.linux.dev" <regressions@lists.linux.dev>, "regressions@leemhuis.info" <regressions@leemhuis.info>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>
Subject: Re: [REGRESSION][BISECTED] from bd9bbc96e835: cannot boot Win11 KVM guest
Message-ID: <b6d8WzC2p_tpdLs36QeL_oqtEKy_pRy-PdeOxa08JtTcPhHNNOCjN73b799C0gv8NnmIJKH9gD6J4W-Dv5JKEVdrbMoVUp3wSOrqEY_LrDg=@ranguvar.io>
In-Reply-To: <Z2BaZSKtaAPGSCqb@google.com>
References: <jGQc86Npv2BVcA61A7EPFQYcclIuxb07m-UqU0w22FA8_o3-0_xc6OQPp_CHDBZhId9acH4hyiOqki9w7Q0-WmuoVqsCoQfefaHNdfcV2ww=@ranguvar.io> <20241214185248.GE10560@noisy.programming.kicks-ass.net> <gvam6amt25mlvpxlpcra2caesdfpr5a75cba3e4n373tzqld3k@ciutribtvmjj> <Z2BaZSKtaAPGSCqb@google.com>
Feedback-ID: 7618196:user:proton
X-Pm-Message-ID: cb7daf2d21f0020e7d28b64803a9024a5c888504
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Monday, December 16th, 2024 at 16:50, Sean Christopherson <seanjc@google=
.com> wrote:
>=20
> On Mon, Dec 16, 2024, Juri Lelli wrote:
>=20
> > On 14/12/24 19:52, Peter Zijlstra wrote:
> >=20
> > > On Sat, Dec 14, 2024 at 06:32:57AM +0000, Ranguvar wrote:
> > >=20
> > > > I have in kernel cmdline `iommu=3Dpt isolcpus=3D1-7,17-23 rcu_nocbs=
=3D1-7,17-23 nohz_full=3D1-7,17-23`. Removing iommu=3Dpt does not produce a=
 change, and
> > > > dropping the core isolation freezes the host on VM startup.
>=20
> As in, dropping all of isolcpus, rcu_nocbs, and nohz_full? Or just droppi=
ng
> isolcpus?

Thanks for looking.
I had dropped all three, but not altered the VM guest config, which is:

<cputune>
<vcpupin vcpu=3D'0' cpuset=3D'2'/>
<vcpupin vcpu=3D'1' cpuset=3D'18'/>
...
<vcpupin vcpu=3D'11' cpuset=3D'23'/>
<emulatorpin cpuset=3D'1,17'/>
<iothreadpin iothread=3D'1' cpuset=3D'1,17'/>
<vcpusched vcpus=3D'0' scheduler=3D'fifo' priority=3D'95'/>
...
<iothreadsched iothreads=3D'1' scheduler=3D'fifo' priority=3D'50'/>
</cputune>

CPU mode is host-passthrough, cache mode is passthrough.

The 24GB VRAM did cause trouble when setting up resizeable BAR months ago a=
s well. It necessitated a special qemu config:
<qemu:commandline>
<qemu:arg value=3D'-fw_cfg'/>
<qemu:arg value=3D'opt/ovmf/PciMmio64Mb,string=3D65536'/>
</qemu:commandline>
