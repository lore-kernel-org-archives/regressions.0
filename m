Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C0058F6A
	for <regressions@lists.linux.dev>; Tue, 24 Jan 2023 21:38:13 +0000 (UTC)
Received: by mail-oi1-f178.google.com with SMTP id p133so14584168oig.8
        for <regressions@lists.linux.dev>; Tue, 24 Jan 2023 13:38:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7JehzhdrkWMsTsXozX6TPCwiwh1w1l2PgeaZJIaxC7M=;
        b=VPPaDBtyw0aRgAevKbuHldlym7Sy1aRxXFn7NX236OSrJ6aAlbgKPyZdpPWIJYjKVE
         dCD9QQIPFNXERpXW9YBOmA8PtZ2epdRNzAoL1DijysvbF6cNr4+j01ckstYCda3WWmuy
         UPnG2KFgDMjyfUkY7OQe8xWkIbhzkx8lpxEs9Et4SbGZRw3eeM2xfICFBgbiVH7C4VY0
         7Kz4esBaOBkumRFqQVzE1A+DF1mGYbpLM0zUzb6duV7UpkAjNwnxJVjL+AoSH+Aq49fZ
         1XlIyTZ2NDKeVmeODM/cb1nWXxH5pQmNx+ebMlrRlyi6dvp4Dd+BJFoYh7GVGj/Bd6JE
         CMKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7JehzhdrkWMsTsXozX6TPCwiwh1w1l2PgeaZJIaxC7M=;
        b=R86uGp+MAOV9+knL3UIE9t4/IRfdbuoKXcAgkDdFaKzbOmdX2N3VLc3vxDeMV19NGO
         l1/kIAhnBOT5cddmOKuYhhNNVQXxZLLfRkcBP20S+u2NCFuCpB5YWOcUSP4p04/QhaxP
         dbJqn49YhYCA4Fpk/SIojmlPUYlX0EY+L63Qau7YIFlf17ZVeEdij7yySeV2O/BlMWkn
         HiygWQ+rLmcgWt2Mf31BIChP3RtdnPS03aLFs6CW3u09OLTx7AX0bGnHrdiFHIgYWR0f
         xfya5wkDTNe9ljfRu/5YCbwkz6FGpMJWr2F5j//lsYyBqOXKggofsF1UfOHsLqAow9P6
         5tDQ==
X-Gm-Message-State: AO0yUKWPGS8dCJo58WANQmUnvCUHmJ6SvB678J4y2l6nmIOji1NCqIZd
	qpjlnYNKwqOAz9fWv4jxPta/UUVpccI0BAjGhxs=
X-Google-Smtp-Source: AK7set+V9etwiE6xzCXy1Xm6RbEUxuJXvo3mBrDr+wOeRzKcOFlFsw2ovnUkxQM1c/eiwV/kZofVmzrBUp/Kw5jEfL0=
X-Received: by 2002:a05:6808:2124:b0:36f:18f:cdfb with SMTP id
 r36-20020a056808212400b0036f018fcdfbmr224429oiw.270.1674596292448; Tue, 24
 Jan 2023 13:38:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CALFERdzKUodLsm6=Ub3g2+PxpNpPtPq3bGBLbff=eZr9_S=YVA@mail.gmail.com>
 <Y89n98fRfTpLmPUg@kroah.com> <CAFJ_xbqMx8LsD_Ry70jnqVmmhyGjTFpA-Gv7SpRR21v3Djr1DA@mail.gmail.com>
 <CALFERdxxAt5+Y0nxbEieYSZX8YLTA9aogtGWLLZBEpGdbWxT-g@mail.gmail.com>
 <CAFJ_xbrAVZDtXwe0Ku0V7b1xp580N+ao0caCRP1xiHBr11oKyQ@mail.gmail.com> <CALFERdwpbQdpnyLuHxo67S4KC=if97AzLGDRVEo+u-HN2Tu0fg@mail.gmail.com>
In-Reply-To: <CALFERdwpbQdpnyLuHxo67S4KC=if97AzLGDRVEo+u-HN2Tu0fg@mail.gmail.com>
From: Sasa Ostrouska <casaxa@gmail.com>
Date: Tue, 24 Jan 2023 22:38:01 +0100
Message-ID: <CALFERdwXwJxZ=jG=p6J1LUERzL9=xaiixN1t4Ux11axMW3CJuw@mail.gmail.com>
Subject: Re: Google Pixelbook EVE, no sound in kernel 6.1.x
To: Lukasz Majczak <lma@semihalf.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, stable@vger.kernel.org, 
	regressions@lists.linux.dev, 
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, 
	Cezary Rojewski <cezary.rojewski@intel.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, Jan 24, 2023 at 3:31 PM Sasa Ostrouska <casaxa@gmail.com> wrote:
>
> On Tue, Jan 24, 2023 at 1:11 PM Lukasz Majczak <lma@semihalf.com> wrote:
> >
> > > If you need anything else just let me know.
> > >
> > > Thanks
> > > Sasa
> >
> > Sasa,
> >
> > Thank you for sharing logs from the working version - could you also
> > provide dmesg for the no sound scenario? You can also share them using
> > e.g. https://gist.github.com/ .
>
> Lukasz thanks, sure, will provide that too but let me reboot into the
> non working kernel.
> Will post it on gist.github.com and post the link here.
>
Hi Lukasz, please see the dmesg with the non working sound kernel:
https://gist.github.com/saxa/08b233a95d5e52046354b07d2e9ca13d

> Rgds
> Sasa
> >
> > Best regards,
> > Lukasz
