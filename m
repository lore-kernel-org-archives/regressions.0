Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E66DD538B
	for <regressions@lists.linux.dev>; Thu, 27 Jul 2023 06:09:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1690438150;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YYQikt/RSGLbWmkNXwyvyF8FZ4OuKgmHNL/qSc2r2Mw=;
	b=SCuWBJhvNXR3/a3dtl42onnDGboWOpNmyt8xfRAyeX6e4Q+2ILzj70kcOENEedSyR1/SWv
	VzCVSV4Mvtonr6ncYgn9nCb+WkoCIAq0eYTqjBv+UrK371A43McyfKBrY0T9+N/UvhtxaK
	qSRxPK4AAL71EIedd5VTA4r2RF9ttpA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-130-rGf4UqSEPpm3nW-nJFppzg-1; Thu, 27 Jul 2023 02:09:09 -0400
X-MC-Unique: rGf4UqSEPpm3nW-nJFppzg-1
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-3fd2778f5e4so2063505e9.1
        for <regressions@lists.linux.dev>; Wed, 26 Jul 2023 23:09:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690438148; x=1691042948;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YYQikt/RSGLbWmkNXwyvyF8FZ4OuKgmHNL/qSc2r2Mw=;
        b=QT88J6EPzxXXq8t+Nlob0G/AAa2g6VJxsdx1HuDMNkKg5WMOxgaI1HhsB0f8rQfYPZ
         amEqLGT8u1gastyDDMx+1Bz4EH9zOp0/QeuSKhuIW/Azd2VtrardUgWDOgsKeRrpIVH4
         XAB0igZgJ83BNU41fROBzdG0cVh8G1RKoYnSvQdf3W8Cr7A93qQFFsB6uZ/5MVrRtjCn
         ykg5k8X+bMQukVmtaYkR6i9WBM1rCMPGgn54aBCVdvP71cDp3UTXqIuRh0b1+X1Y59wp
         vKmKQHz/oDd0J1UcQnMghntxQfaDV9rB0mhVB1PARX5XdrbdjEgZ+K/osay2mc+JjVag
         Afbg==
X-Gm-Message-State: ABy/qLYnL2oZXU6Vf5to5Bs5NxdbLqpP+cD4HRLwsPaQCf1SFL7vTKEj
	p322IBtgnbky4Fbj263lVUsQC1mYYP2jJjuNM1Mj2mGYEto9fR1vAx6DeWJcpa9xrgFqpdv30O+
	EVokAvgmdvr/tgqj0OC2xnzA=
X-Received: by 2002:a05:600c:21d8:b0:3fd:dd53:d9a3 with SMTP id x24-20020a05600c21d800b003fddd53d9a3mr774464wmj.17.1690438148432;
        Wed, 26 Jul 2023 23:09:08 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFEJZQhApZRMbtLl2Ru/qutbhOPA4DROP8Vhc2vZ299DZKe6FqdK5pidW3CwisM1rCOLNo8mQ==
X-Received: by 2002:a05:600c:21d8:b0:3fd:dd53:d9a3 with SMTP id x24-20020a05600c21d800b003fddd53d9a3mr774455wmj.17.1690438148167;
        Wed, 26 Jul 2023 23:09:08 -0700 (PDT)
Received: from redhat.com ([31.187.78.131])
        by smtp.gmail.com with ESMTPSA id l5-20020a05600c1d0500b003fbb1ce274fsm15354729wms.0.2023.07.26.23.09.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jul 2023 23:09:07 -0700 (PDT)
Date: Thu, 27 Jul 2023 02:09:02 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Woody Suwalski <terraluna977@gmail.com>, imammedo@redhat.com,
	bhelgaas@google.com, LKML <linux-kernel@vger.kernel.org>,
	linux-pci@vger.kernel.org, regressions@lists.linux.dev,
	"Linux regression tracking #adding (Thorsten Leemhuis)" <regressions@leemhuis.info>
Subject: Re: Kernel 6.5-rc2: system crash on suspend bisected
Message-ID: <20230727020621-mutt-send-email-mst@kernel.org>
References: <11fc981c-af49-ce64-6b43-3e282728bd1a@gmail.com>
 <20230720202110.GA544761@bhelgaas>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20230720202110.GA544761@bhelgaas>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 20, 2023 at 03:21:10PM -0500, Bjorn Helgaas wrote:
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
> 
> Bjorn

Patch on list now:
https://lore.kernel.org/all/20230726123518.2361181-1-imammedo%40redhat.com

-- 
MST

