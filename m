Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27EBF49899
	for <regressions@lists.linux.dev>; Mon, 18 Dec 2023 19:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GDEV72qU"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5534180f0e9so2208a12.1
        for <regressions@lists.linux.dev>; Mon, 18 Dec 2023 11:39:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1702928357; x=1703533157; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5umlgnbsnFZiZVJ0cVpQu5AC72Lnsh+rnvB7uAFTfiY=;
        b=GDEV72qUwJLnTVCewtncwmDaeJ4OhQygCUbV1sSApwntVq5h9dPm9gegn3zIrbWuhr
         WxLjprfoiUeFQOI/eyWc0/DSiYZpYImyO92sTWGOd4A6EPq5S3DrGW0cwep7+FFFF3pn
         w2PhzgjQhUx8f7//qpc1nPgjHfPZdWl2H2S+tEpbRNbQjHBcFnko7eo0/Ckldw5M3C+s
         jChx02QDQDS68Knj0whs3H49xqqn3yHgjJSSsyop5/8uNUbTQ44VbebKiju+SITeBxjT
         XQw+B3QfzEr+Zetq4CyFg+8obmkjPsz9Iy7jTIoxeNVKCZQBNrRbd1TetIJWO9cVCIdM
         3VJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702928357; x=1703533157;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5umlgnbsnFZiZVJ0cVpQu5AC72Lnsh+rnvB7uAFTfiY=;
        b=T607f69cvB34pvAvlI4M929iLeaCdw057tqfI+6iOtokrdP7hf+PlV1nk3Ny7ZA4qj
         Omdfav+xKitqSDiYrrdglNnLQnva/cNZ3h8CVbuG68T8gMd+jjdKoKWojXvDdwKsKfAs
         mNX2LOdH4kyIqLO7Xp9hGwqfSfxys/DLSd2Q5Li4iEsOjThA62o1Ll3evUxkKnuRc0EV
         3gXcQKPqT0GD6wkQuii5m7w2rEwC3+X85X+4erXPE0GGpvkDxeCWE+E97Z/ZBE2Q5c7a
         ISYpUQsZr443QJn6JlE5BU4B0X4ym1yraJXXJP959lo0/rViixdjOO/36FtefAiXt5pa
         tIEw==
X-Gm-Message-State: AOJu0YzqtLVYGBPea8a8COjeARyA353LfG7MDOx594jKK8/9RdwUXG2P
	VXhz0mp/Gesqz2Kxd8+ZfOHTfratheD3xS1NOK/njmLf8FM=
X-Google-Smtp-Source: AGHT+IG2zTOcLT/slo8Xy1NCbxTjx8uZ3GB00uyChCN28rM0o4JcEyf70j7nxUJQlMxzM1AFksLtvXT6JGsj12dWHxE=
X-Received: by 2002:a50:d0cd:0:b0:553:7ff4:5885 with SMTP id
 g13-20020a50d0cd000000b005537ff45885mr34380edf.2.1702928357402; Mon, 18 Dec
 2023 11:39:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <000000000000b505f3060c454a49@google.com> <ZXfBmiTHnm_SsM-n@sashalap>
 <CAJc0_fz4LEyNT2rB7KAsAZuym8TT3DZLEfFqSoBigs-316LNKQ@mail.gmail.com>
 <2023121848-filter-pacifier-c457@gregkh> <2023121834-abiding-armory-e468@gregkh>
In-Reply-To: <2023121834-abiding-armory-e468@gregkh>
From: Robert Kolchmeyer <rkolchmeyer@google.com>
Date: Mon, 18 Dec 2023 11:39:04 -0800
Message-ID: <CAJc0_fzhWtHJJ+7j6vKoSxppVS0TpbqGZ398JwLs=dkUjUTzhQ@mail.gmail.com>
Subject: Re: IMA performance regression in 5.10.194 when using overlayfs
To: Greg KH <greg@kroah.com>
Cc: Sasha Levin <sashal@kernel.org>, stable@vger.kernel.org, 
	linux-integrity@vger.kernel.org, regressions@lists.linux.dev, 
	eric.snowberg@oracle.com, zohar@linux.ibm.com, jlayton@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 18, 2023 at 3:58=E2=80=AFAM Greg KH <greg@kroah.com> wrote:
>
> On Mon, Dec 18, 2023 at 12:57:20PM +0100, Greg KH wrote:
> > On Tue, Dec 12, 2023 at 04:37:31PM -0800, Robert Kolchmeyer wrote:
> > > > Looking at the dependencies you've identified, it probably makes se=
nse
> > > > to just take them as is (as it's something we would have done if th=
ese
> > > > dependencies were identified explicitly).
> > > >
> > > > I'll plan to queue them up after the current round of releases is o=
ut.
> > >
> > > Sounds great, thank you!
> >
> > I've dropped them now as there are some reported bug fixes with just
> > that commit that do not seem to apply properly at all, and we can't add
> > new problems when we know we are doing so :)
> >
> > So can you provide a working set of full backports for the relevant
> > kernels that include all fixes (specifically stuff like 8a924db2d7b5
> > ("fs: Pass AT_GETATTR_NOSEC flag to getattr interface function")) so
> > that we can properly queue them up then?
>
> Also don't forget 18b44bc5a672 ("ovl: Always reevaluate the file
> signature for IMA") either.  There might be more...
>
> thanks,
>
> greg k-h

Thanks - from what I can tell with `git log --grep`, 8a924db2d7b5
("fs: Pass AT_GETATTR_NOSEC flag to getattr interface function") is
the only such fix we need to backport (18b44bc5a672 ("ovl: Always
reevaluate the file signature for IMA") is already in stable trees and
introduced the regression that motivated this investigation).

I'll prepare these backports and send them to the list.

Thanks,
-Robert
