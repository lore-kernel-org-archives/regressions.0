Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E62763BE
	for <regressions@lists.linux.dev>; Mon, 24 Jul 2023 09:27:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1690190844;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1aqMAns950u+zeLChDvq/fTf6JcAIcxdD0X+X9fGaDg=;
	b=dHSFMCarelh24O269Mz6ScTucER+mRVaf5ynVhYy9eS2AT0h1dwVAoGENBdt9ocuMhKd6R
	kv7zg0m6/h09IkO/1BsQMkwHIa0cdFHk78PhvbPejSjDDewuK3A1gFxPAsasrOY8bIvVBy
	P0zr17OUA2WfDm9VmuHRS0T8jQRpmVY=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-7-Kv7SDObbO_-J4vH7pxmi4w-1; Mon, 24 Jul 2023 05:27:23 -0400
X-MC-Unique: Kv7SDObbO_-J4vH7pxmi4w-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-98843cc8980so359390866b.1
        for <regressions@lists.linux.dev>; Mon, 24 Jul 2023 02:27:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690190841; x=1690795641;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1aqMAns950u+zeLChDvq/fTf6JcAIcxdD0X+X9fGaDg=;
        b=lOKtWn6yr0kRd8H/womZNze6KSErNqA55e9CBuJmNtYNIzsviE/U15UbIZ/fklc0hN
         Y+81q9DD9OIew2vZKLXwSmaWEIQJAJicQWe6NhS/cjex8lM9ZTlY2QWJSr0qznF0T2vD
         dCA5/cEFWldznlTDFrluLD5pgYA8ezn2fKmOxNBTJRQb21PO3aiuUJmpTarT6+cE0MiU
         82eNbQJMVt4zsaigljA4SlkDmDzOfC1K7xd/VpOSZVTwE7wRIlFZyyWfco7fgVSzsxfb
         GWdTBdFOUz9edrM9P7KXYfQKrWPE/+ykWnXR6aMWcl1qKyIFVdiWDl8JE5xbrlzlWcpZ
         7xXg==
X-Gm-Message-State: ABy/qLYEiEaD+DfIA59q9tv38mjKxNHhdHfUi5TvtTb/9Jbt6ytgHsK1
	ulboNVA8xbnWzNvGhcFIvvLoFROJMFEF4k3jB1MuAjQ0NV32U9qOBCSEBURmhr3nZ/3qI4Nru5u
	KPdEcJd3Ds0uhFriCrzEV8bt6bvs4+GM=
X-Received: by 2002:a17:906:20d5:b0:982:b920:daad with SMTP id c21-20020a17090620d500b00982b920daadmr9023032ejc.71.1690190841289;
        Mon, 24 Jul 2023 02:27:21 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGkOHHyH0ujc9pe4rnlwS2N6pWHUtZ+xEuD7FMvL62WIORJ/7vrnSFDWQ7InVEBhf+I+FviZQ==
X-Received: by 2002:a17:906:20d5:b0:982:b920:daad with SMTP id c21-20020a17090620d500b00982b920daadmr9023019ejc.71.1690190840938;
        Mon, 24 Jul 2023 02:27:20 -0700 (PDT)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com. [213.175.37.10])
        by smtp.gmail.com with ESMTPSA id r7-20020a170906c28700b0099b42c90830sm6406269ejz.36.2023.07.24.02.27.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jul 2023 02:27:20 -0700 (PDT)
Date: Mon, 24 Jul 2023 11:27:19 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Woody Suwalski <terraluna977@gmail.com>, bhelgaas@google.com, LKML
 <linux-kernel@vger.kernel.org>, linux-pci@vger.kernel.org,
 regressions@lists.linux.dev
Subject: Re: Kernel 6.5-rc2: system crash on suspend bisected
Message-ID: <20230724112719.3fd90eb1@imammedo.users.ipa.redhat.com>
In-Reply-To: <20230720202110.GA544761@bhelgaas>
References: <11fc981c-af49-ce64-6b43-3e282728bd1a@gmail.com>
	<20230720202110.GA544761@bhelgaas>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 20 Jul 2023 15:21:10 -0500
Bjorn Helgaas <helgaas@kernel.org> wrote:

> [+cc regressions list]
> 
> On Wed, Jul 19, 2023 at 11:36:51PM -0400, Woody Suwalski wrote:
> > Laptop shows a kernel crash trace after a first suspend to ram, on a second
> > attempt to suspend it becomes frozen solid. This is 100% repeatable with a
> > 6.5-rc2 kernel, not happening with a 6.4 kernel - see the attached dmesg
> > output.
> > 
> > I have bisected the kernel uilds and it points to :
> > [40613da52b13fb21c5566f10b287e0ca8c12c4e9] PCI: acpiphp: Reassign resources
> > on bridge if necessary
> > 
> > Reversing this patch seems to fix the kernel crash problem on my laptop.  
> 
> Thank you very much for all your work debugging, bisecting, and
> reporting this!  This is incredibly helpful.
> 
> Original report, including complete dmesg logs for both v6.4 and
> v6.5-rc2:
> https://lore.kernel.org/r/11fc981c-af49-ce64-6b43-3e282728bd1a@gmail.com
> 
> I queued up a revert of 40613da52b13 ("PCI: acpiphp: Reassign
> resources on bridge if necessary") (on my for-linus branch for v6.5).
> 
> It looks like a NULL pointer dereference; hopefully the fix is obvious
> and I can drop the revert and replace it with the fix.

it happens here:

2145	void pci_assign_unassigned_bridge_resources(struct pci_dev *bridge)
2146	{
2147		struct pci_bus *parent = bridge->subordinate;

Let's see if it reproducable on Lenovo laptop and what reading
involved code yields.
If I can't figure it out anyways, I'll come up with a patch
to trace issue. 

> 
> Bjorn
> 

