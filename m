Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 992E51859
	for <regressions@lists.linux.dev>; Wed, 26 Apr 2023 06:05:40 +0000 (UTC)
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-1879fc89e67so4429133fac.0
        for <regressions@lists.linux.dev>; Tue, 25 Apr 2023 23:05:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682489139; x=1685081139;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=V4i0azaBg7O2s6i4lwA15XawiNtASRWPXQ/VuKlA5y4=;
        b=DZGRz3tSKIM2yXRQmQejA1m9L1rhn9ngygTpxg2tEEFW4UHsFzpizqKNaC0i5ZMsB9
         Wf/6DqLPtTBZ4UCIRcvDMsFtPExPvuKsnYn4cl/6V09kaJV2b7KuHdAPGGqg14Ba71/6
         BFWTSJonGZp1HtMPI1LRPuGCoo2jkqSoTJXpGZNE3wZ7HumZfFY99/gKVhgH013dnqpa
         nZ2Cbhare84sYNoDNaIBkyN42makDPewKDVUGI4hghhDjUhSx8Xy0dU4GyjX9CEfs6XQ
         sTA+nSvekL+Jt0zR4FcB2ITzZUnEPY6BM7l6Wqgl7RNiQBycHPo/lYgkYZcV40J35XI0
         nQOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682489139; x=1685081139;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V4i0azaBg7O2s6i4lwA15XawiNtASRWPXQ/VuKlA5y4=;
        b=BT/MRFphT+NjUFBH7sZSoTKZ0+DibL/KUcCh9qZCuomKPsnT3t2bEsY9h6+ScVaTm2
         RcsTccxmi9ZB5YtzjCaw3zo5SGVYDHvBwVK402EQEosNxPiVg+NT7NfdTpiX4rlsqsgD
         G/7KUjPIXJT3NpERm8XkM+yAhtM/bKU3jjDXl6hc+Omd2S/vF27tt57lWUgfWucvuLm1
         pwHM0DKXUj/IPxvPsL8BcMzh4PCqd1SMGFkFtYh/sblDqA0zm9a1yyISv1IEcfsIBSjn
         AAWIc8vpJXHveBxPGrPlWeNOdICo5HzcPxzwonF2eK/bN8DXyzrG3wNONJ4MpR8zqsu/
         fJwQ==
X-Gm-Message-State: AAQBX9clFz8EcuO1m4wDQsyETw06X/06OU8d+o3imX9gacDWD9vuE+TN
	xZMk8tckh9GhSFPFD5C1dh8=
X-Google-Smtp-Source: AKy350ZHxqPcx48WmgJoNKk72NuAnR2wRNBXtbnH/rNu5oApfZDn4ef/OFrMfGVEPtbRYNXgZGn/UQ==
X-Received: by 2002:a05:6870:8a11:b0:184:6a66:fd9e with SMTP id p17-20020a0568708a1100b001846a66fd9emr11813434oaq.8.1682489139578;
        Tue, 25 Apr 2023 23:05:39 -0700 (PDT)
Received: from geday ([2804:7f2:8006:a502:65e3:3fd9:3321:ba17])
        by smtp.gmail.com with ESMTPSA id p22-20020a05687052d600b0017243edbe5bsm6280115oak.58.2023.04.25.23.05.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Apr 2023 23:05:39 -0700 (PDT)
Date: Wed, 26 Apr 2023 03:05:53 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: Jakub Kicinski <kuba@kernel.org>, Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org, linux-usb@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	regressions@lists.linux.dev
Subject: Re: USB sound card freezes USB after resume from suspend
Message-ID: <ZEi/QWRlJetMZ2R9@geday>
References: <20230425111924.05cf8b13@kernel.org>
 <87pm7rtdul.wl-tiwai@suse.de>
 <ZEi6x155vF5GLeXT@geday>
 <87mt2vtc31.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87mt2vtc31.wl-tiwai@suse.de>

On Wed, Apr 26, 2023 at 08:02:58AM +0200, Takashi Iwai wrote:
> On Wed, 26 Apr 2023 07:46:47 +0200,
> Geraldo Nascimento wrote:
> > 
> > Hello Jakub and Takashi,
> > 
> > On Wed, Apr 26, 2023 at 07:24:50AM +0200, Takashi Iwai wrote:
> > > On Tue, 25 Apr 2023 20:19:24 +0200,
> > > Jakub Kicinski wrote:
> > > > 
> > > > Hi!
> > > > 
> > > > For a few weeks now I can't use any USB devices if I suspend my laptop
> > > > with my USB sound card active and resuming it without it connected.
> > 
> > Takashi, did you pay attention to the workflow of triggering Jakub's
> > bug? He suspends the computer with the sound card active, disconnects
> > the sound card and expects to resume his computer back to an usable
> > state.
> 
> It's a pretty normal procedure for many people; most of USB type-C
> docks have a USB audio built-in, and people remove the machine from
> the dock after suspend.  So that's an operation that is seen everyday
> everywhere.
> 
> Still I haven't heard this issue, and it implies that it's either
> something new or specific to the machine or the environment.  Or we've
> been just lucky...
> 
> 
> Takashi

Understood, sorry for adding noise then.

Thanks,
Geraldo Nascimento
