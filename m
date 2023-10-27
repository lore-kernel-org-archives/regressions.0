Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C04201EB21
	for <regressions@lists.linux.dev>; Fri, 27 Oct 2023 13:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ax0WXqrN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1698413113;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=e1cvxdxPvtUX/vR/ZZ/ap3IrH5drcPkX5BNNFPbDVUM=;
	b=ax0WXqrNU/9k6rfMn0FzrGpjI45cubTUeVoVALXhliGPiGnJNn2Hl2rkW46KFGWJirv6xg
	2bEBgKw37agqxyjknK6DO/f9zu34wfctkQD1E/OTYEdyKXnc0PwswTOIc3BogtZBUmUSlO
	QC+4snrGb/cRVpnpdMJB3grqWZtd5io=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-684-c7ImkFzkPCOIqjXMevFOYw-1; Fri, 27 Oct 2023 09:25:11 -0400
X-MC-Unique: c7ImkFzkPCOIqjXMevFOYw-1
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-27dd8d7d6c3so1828294a91.1
        for <regressions@lists.linux.dev>; Fri, 27 Oct 2023 06:25:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698413111; x=1699017911;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e1cvxdxPvtUX/vR/ZZ/ap3IrH5drcPkX5BNNFPbDVUM=;
        b=Ak9lspAgzImU3fo+siWUNnElSoCmVwT6uFapc9mxozpO/Niq8zLf/HWND1oTJmbS5r
         E9u+GWXnDrBU83Bd3APyn7SqhJtqcNDKQ26GdG4/xPpvL9rmvB1DYSArr+Wk8WNP2M2I
         RsdrRriQTmB1UWR5cZBDjDybK5nVecpYyZC4mbGSHezQb1yEc2op3NsH00M6aSKGn9hw
         SANrk1qAlTResNcyT6r/zmMGKGAJsv/NDepVBsmp2S8FHGvMyv09hMZkjJxn81Vj0wVu
         mVfOzFCIPq/4ctlA8oS8g5AjTGm+wbgMwr3sBmfxW6l5jRQr8LV1kJZ9PC0RBYtdzs0h
         158g==
X-Gm-Message-State: AOJu0YwfWk1EG2ljF9T0urJfwTo3t8C5Xh5kOI5jLVcjgCjZcKAmMRMa
	TjpVd5vNMManTlYQusiO4bz6O0VJx+pxbw+iIRjpFtAjMgI6zah9x2YkiPeVs1CUYMWkzSnQGnT
	qMw6qReCbSTslMu93ZYdoSuwo1NjjHWC03kGSpAE=
X-Received: by 2002:a17:90a:fd8e:b0:27f:f61c:327d with SMTP id cx14-20020a17090afd8e00b0027ff61c327dmr2409984pjb.0.1698413110819;
        Fri, 27 Oct 2023 06:25:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFDTqUCN6moDjH/gfXnYBxMVSGumEFqX6K29llxBiu7RZwEpOowr388vuT/hj3g6JDGgaCJ9PcOQnv43Tmqtfs=
X-Received: by 2002:a17:90a:fd8e:b0:27f:f61c:327d with SMTP id
 cx14-20020a17090afd8e00b0027ff61c327dmr2409971pjb.0.1698413110598; Fri, 27
 Oct 2023 06:25:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <717fd97a-6d14-4dc9-808c-d752d718fb80@ddn.com> <4b0b46f29955956916765d8d615f96849c8ce3f7.camel@linaro.org>
 <fa3510f3-d3cc-45d2-b38e-e8717e2a9f83@ddn.com> <1b03f355170333f20ee20e47c5f355dc73d3a91c.camel@linaro.org>
 <9afc3152-5448-42eb-a7f4-4167fc8bc589@ddn.com> <5cd87a64-c506-46f2-9fed-ac8a74658631@ddn.com>
 <8ae8ce4d-6323-4160-848a-5e94895ae60e@leemhuis.info> <CAOssrKdvy9qTGSwwPVqYLAYYEk0jbqhGg4Lz=jEff7U58O4Yqw@mail.gmail.com>
 <2023102731-wobbly-glimpse-97f5@gregkh> <CAOssrKfNkMmHB2oHHO8gWbzDX27vS--e9dZoh_Mjv-17mSUTBw@mail.gmail.com>
 <2023102740-think-hatless-ab87@gregkh> <CAOssrKd-O1JKEPzvnM1VkQ0-oTpDv0RfY6B5oF5p63AtQ4HoqA@mail.gmail.com>
 <689f677b84b484636b673b362b17a6501a056968.camel@linaro.org>
In-Reply-To: <689f677b84b484636b673b362b17a6501a056968.camel@linaro.org>
From: Miklos Szeredi <mszeredi@redhat.com>
Date: Fri, 27 Oct 2023 15:24:59 +0200
Message-ID: <CAOssrKfP+t-cy322ujizQofgZkPZsBu1H4+zfbWNEFCmTsXwug@mail.gmail.com>
Subject: Re: [PATCH v2] Revert "fuse: Apply flags2 only when userspace set the FUSE_INIT_EXT"
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Linux regressions mailing list <regressions@lists.linux.dev>, 
	"stable@vger.kernel.org" <stable@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Paul Lawrence <paullawrence@google.com>, 
	Daniel Rosenberg <drosen@google.com>, Alessio Balsini <balsini@android.com>, 
	Amir Goldstein <amir73il@gmail.com>, Bernd Schubert <bschubert@ddn.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 27, 2023 at 3:14=E2=80=AFPM Andr=C3=A9 Draszik <andre.draszik@l=
inaro.org> wrote:

> The patch in question has broken all users that use the higher flags
> and that don't use your version of libfuse, not just Android. You're
> filtering them out now when you didn't at the time that those
> ('official) high flags were added. There are a couple more high flags
> than just the one that Android added.

Okay.  Where are all those users?  Why haven't they reported this?

Thanks,
Miklos

