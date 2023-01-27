Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt [193.136.128.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A33A7B
	for <regressions@lists.linux.dev>; Fri, 27 Jan 2023 10:42:59 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id 0E4476007C24;
	Fri, 27 Jan 2023 10:42:51 +0000 (WET)
X-Virus-Scanned: by amavisd-new-2.11.0 (20160426) (Debian) at
	tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
	by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavisd-new, port 10025)
	with LMTP id D_GNnw6Kc8Qd; Fri, 27 Jan 2023 10:42:48 +0000 (WET)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [193.136.128.10])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id 8F1206008769;
	Fri, 27 Jan 2023 10:42:48 +0000 (WET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tecnico.ulisboa.pt;
	s=mail; t=1674816168;
	bh=RVMq2cCO9Sul6gjbW012jY94VUJxlmcmXK6BQRcKNcA=;
	h=Date:From:To:Cc:Subject:In-Reply-To;
	b=WWBJIj/mfTjX9zUBO3vkUdwOTxo3vJYE5g0bv0igowysqsy49iC3qTaxZteHBXao/
	 X2BzNGPsWZeRdcI8QShPbIx8oI8fR+gz9JIsSkM6O4DLRrLds/VzXlAhtzCBC4Zk4k
	 QZtTyRvAXfqz4rUFFRaoaI15hLDa+z5FfPtnUPjY=
Received: from wslaptop (unknown [IPv6:2001:8a0:fbe7:6700:65be:d034:d2ec:60ff])
	(Authenticated sender: ist187313)
	by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id EFF0636008C;
	Fri, 27 Jan 2023 10:42:47 +0000 (WET)
Date: Fri, 27 Jan 2023 10:39:59 +0000
From: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
To: Ben Skeggs <skeggsb@gmail.com>
Cc: airlied@redhat.com, nouveau@lists.freedesktop.org,
	regressions@lists.linux.dev, dri-devel@lists.freedesktop.org,
	kwizart@gmail.com, kherbst@redhat.com
Subject: Re: [REGRESSION] GM20B probe fails after commit 2541626cfb79
Message-ID: <20230127103959.5nqk57sb7qchtaw6@wslaptop>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACAvsv4_XJLSwnA-s0BXLVbBCESDfnK7kx5-WUPd2+vdJuMojg@mail.gmail.com>

On Fri, Jan 27, 2023 at 04:00:59PM +1000, Ben Skeggs wrote:
> On Fri, 20 Jan 2023 at 21:37, Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt> wrote:
> >
> > On Wed, Jan 18, 2023 at 11:28:49AM +1000, Ben Skeggs wrote:
> > > On Mon, 16 Jan 2023 at 22:27, Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt> wrote:
> > > > On Mon, Jan 16, 2023 at 07:45:05AM +1000, David Airlie wrote:
> > > > > As a quick check can you try changing
> > > > >
> > > > > drivers/gpu/drm/nouveau/nvkm/core/firmware.c:nvkm_firmware_mem_target
> > > > > from NVKM_MEM_TARGET_HOST to NVKM_MEM_TARGET_NCOH ?
> >
> > > In addition to Dave's change, can you try changing the
> > > nvkm_falcon_load_dmem() call in gm20b_pmu_init() to:
> > >
> > > nvkm_falcon_pio_wr(falcon, (u8 *)&args, 0, 0, DMEM, addr_args,
> > > sizeof(args), 0, false);
> >
> > Chiming in just to say that with this change I see the same as Nicolas
> > except that the init message size is 255 instead of 0:
> >
> > [    2.196934] nouveau 57000000.gpu: pmu: unexpected init message size 255 vs 42
> I've attached an entirely untested patch (to go on top of the other
> hacks/fixes so far), that will hopefully get us a little further.

Hello,

Thank you for the patch! I can confirm that it fixes the problem
on the Pixel C, and everything works as before the regression.
With this, for the combination of patches

Tested-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt> 

which I can resend after testing the final patch version.

Thanks,
Diogo
