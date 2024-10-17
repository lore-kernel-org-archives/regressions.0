Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BA1729A5
	for <regressions@lists.linux.dev>; Thu, 17 Oct 2024 00:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729123804; cv=none; b=oUXTbDYaZ8tava12mh9DwPmfZoT9NMGW6soihoCX3PuYTgIHSUhBRd9sMDMU/NjD7QF7cZgAG/tyx+LUIyHaAO3DnFbCeAydCrg+kW5beWSDH05AcTrycPq9DXSfCwGrjLGkoa+5QnsHflQUI0wYegA+yMY1H517VBc0B3tKBPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729123804; c=relaxed/simple;
	bh=IlO6uTCwFsYUVRbfNrr8hXDOR6fAvnjyaa8Rrpvdxnc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Tj7Zrph1Bo7Q6Zc3rz2fIsxbMzzW7eCuNB/EYNXjHLCZeRLXBIbwTIMvqfgozSfgEdK98q7EyJEez+iBCSoFPsD3TqMk7GH4QG2YR4/CcrzN+bcITJho9lZ0PJ7Zdlqb/2IMMVA8bX+uJIcISBQJvuOi3EJAjdZBtCSIF+Qb8AM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=n3Rqzi+e; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="n3Rqzi+e"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a9a0ef5179dso44665566b.1
        for <regressions@lists.linux.dev>; Wed, 16 Oct 2024 17:10:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729123800; x=1729728600; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5zLK8NZJ63lThqHunA+xhjqEZN8qClvg0Kr82H/Gl4Y=;
        b=n3Rqzi+eRwOQikuEMYpo28YP8AZEp7DJhLCIPc6ckxMCFoixMD7nULU9cImYomQHcv
         BgUDmpRw87YQXYSiXC5jt7Z5nHLM5ZoBREuqN/pgjUjXZgjZBpiOv0ynkKDbbQ6TWyPB
         D+Pzc7GBQ2Mff9luu8iNf3AGFY3biuEzFCn22dK9losoFlRomc558SHKM3OxJOj/EvqA
         Y/8cU8MzLJcv/MkLzvAqV15UlzUvIi9w7zS7/f/jCdWbpsHIRvuf5gIsPmy+/hi0cCA+
         5q7sK3T4VOENXud3dCUQUQoL4sY4iYO4/+9cV2KzhqEDRzXrOV28fyQKwUW1q9LbpyOo
         ZHMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729123800; x=1729728600;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5zLK8NZJ63lThqHunA+xhjqEZN8qClvg0Kr82H/Gl4Y=;
        b=sc9p7NmkTm2aM+1ilBnKxTRKCF27pb4tWwF5ehQ/hxsnTMg20lSfx2xHLx1gluSdeL
         f9BCP5xN2cpkUTneD1BCf9ILv8RYteqv52PDXv6SnmnfIMU8vWRSINZxMs6dKVLx2yEg
         ceuXSDaQw6Iis8GiUYBgrZjdeC/yRgsXt7PUPo8010lPhtCvtyo/qchNJ7iVoYogQsfL
         +fq2TJHtue4/kJQm7s3xLg2pE48n9UkbmW5XBVluPiFrOAM3UTxQNvRvur+u2no/0VSx
         Ga5NNR07oHTed3p1qBNUUyyrz1FVIQ9VYo3EF/39wnHkEk69scr/LDfW2mqYZb/JLBI/
         pIPg==
X-Forwarded-Encrypted: i=1; AJvYcCUNDJsNwmoJ1gexx1tdUdKxRlwsv/BQ665IuJaix05JQh6xIMUOP5v/fyveClnDTOKTj5Edvw8GQxs5hA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzalX7mE0PPVbzFPIVZ3SH8Ur/7qls6W/RWqp8kkOCbKBWRPGkV
	s0laplSL0VRYIi19Dk45sTxzrJXcY5pGpLgUwTRwJjv6XS6H26hvExHgaWM0M8ZtQj41Mg0+iKg
	Y/5Oj7EkwXsilb4d2JekAR7R6muUkHUNqqMQ=
X-Google-Smtp-Source: AGHT+IGMVkShiuutDs4xn/HxU/SXYSXezquXUEdikNqROO75/WvPvitz2eCesf0/uCyp+8GS9LoyAmdByQLs5DB4RTA=
X-Received: by 2002:a17:906:c113:b0:a99:60c8:f2c4 with SMTP id
 a640c23a62f3a-a9a34cbc527mr492691766b.15.1729123800140; Wed, 16 Oct 2024
 17:10:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <A499F119-5F0C-43FC-9058-7AB92057F9B3@toblux.com>
 <Zvg-mDsvvOueGpzs@archlinux> <202409281331.1F04259@keescook>
 <21D2A2BB-F442-480D-8B66-229E8C4A63D3@toblux.com> <Zv6BEO-1Y0oJ3krr@archlinux>
 <E8E64A72-3C1C-40D2-9F07-415F6B8F476E@toblux.com> <Zv61dCaxScXuOjZg@archlinux>
 <202410031424.45E5D19@keescook> <Zv8RIs-htdc-PtXB@archlinux>
 <202410040958.C19D3B9E48@keescook> <ZwNb-_UPL9BPSg9N@archlinux> <CAGG=3QUatjhoDHdkDtZ+ftz7JvMhvaQ9XkFyyZSt_95V_nSN8A@mail.gmail.com>
In-Reply-To: <CAGG=3QUatjhoDHdkDtZ+ftz7JvMhvaQ9XkFyyZSt_95V_nSN8A@mail.gmail.com>
From: Bill Wendling <morbo@google.com>
Date: Wed, 16 Oct 2024 17:09:42 -0700
Message-ID: <CAGG=3QVcsuN0Sk79oZWjY_nNTo_XfGYsDT3gc7vEmLyS8OK3rA@mail.gmail.com>
Subject: Re: [REGRESSION][BISECTED] erroneous buffer overflow detected in bch2_xattr_validate
To: Jan Hendrik Farr <kernel@jfarr.cc>
Cc: Kees Cook <kees@kernel.org>, Thorsten Blum <thorsten.blum@toblux.com>, kent.overstreet@linux.dev, 
	regressions@lists.linux.dev, linux-bcachefs@vger.kernel.org, 
	linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org, 
	ardb@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 16, 2024 at 4:41=E2=80=AFPM Bill Wendling <morbo@google.com> wr=
ote:
>
> On Sun, Oct 6, 2024 at 8:56=E2=80=AFPM Jan Hendrik Farr <kernel@jfarr.cc>=
 wrote:
> > > I want to separate several easily confused issues. Instead of just
> > > saying __bdos, let's clearly refer to what calculation within bdos is
> > > being used. There are 3 choices currently:
> > > - alloc_size attribute
> > > - counted_by attribute
> > > - fallback to __bos (which is similar to sizeof(), except that FAMs a=
re 0 sized)
> > >
> > > Additionally there are (for all intents and purposes) 2 size
> > > determinations to be made by __bos and __bdos, via argument 2:
> > > - containing object size (type 0) ("maximum size")
> > > - specific object size (type 1) ("minimum size")
> >
> > "maximum" vs "minimum" size would by type 0 vs type 2, but I think you
> > do mean type 0 and type 1 as those are the types currently used by
> > __struct_size and __member_size. Those are both "maximum" sizes.
> >
> > >
> > > For example, consider:
> > >
> > > struct posix_acl *acl =3D malloc(1024);
> > > acl->a_count =3D 1;
> > >
> > > what should these return:
> > >
> > >       __bos(acl, 0)
> > >       __bos(acl, 1)
> > >       __bdos(acl, 0)
> > >       __bdos(acl, 1)
> > >       __bos(acl->a_entries, 0)
> > >       __bos(acl->a_entries, 1)
> > >       __bdos(acl->a_entries, 0)
> > >       __bdos(acl->a_entries, 1)
> > >
> >
> Thank you for this detailed write-up! I'm sorry for my late response.
>
[snip]
>
> So in conclusion, if turning off the calculation for a pointer to the
> whole struct works, then I'm okay with it.
>
Here's a potential fix:

  https://github.com/llvm/llvm-project/pull/112636

-bw
