Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECD3F1494D7
	for <regressions@lists.linux.dev>; Fri,  5 Jul 2024 11:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720177606; cv=none; b=mfAIOX92J9njlCgGVttXwvXXcbWFVULTG8/axfArFviM+qYITUJ6aLGEcmQbEI2bzldsWOBReXOMVFp4hk+ZMhUMUCiPiDnGHiX5PzTFXOOyoks/3/gXzoTgCWDjNZZGNGn1oZ+PHOENTE90MGtmkraHg4uyzHKN5lLnYBUeAqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720177606; c=relaxed/simple;
	bh=8+WZaP3nhTCnIc1AsENbtDY0K0ju2lbrz8eZmgxBEWs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W72u6aOGri1kUwRHVJgfplansBvQgtJKIJeM5z53LId+N4bJY+umJEhD7zns9WfpWi5rf3OXNOWOYgtCbjiURLBeyASLhU6v8+NnxZ0+n5M4NNFCYBvVOgdwkb03Ak5F8xb7L+TXJfcFwL2lkF4x68/FyvDiAFFEJxpxnMym8BI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YkviSif6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YkviSif6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A456C116B1
	for <regressions@lists.linux.dev>; Fri,  5 Jul 2024 11:06:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720177605;
	bh=8+WZaP3nhTCnIc1AsENbtDY0K0ju2lbrz8eZmgxBEWs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=YkviSif608l3PyrpIrzjpfqMhEuyNel8EH9tgZC+AAUw5qIdfQ0Q/K6q2Z3Anys1A
	 DzQTUVFSpsNJXzsdW3iMTBpLjiLDuF2abP2v/fJ+LjQnSMZQ8YLTgngvWYX608rgMq
	 fZ6oI9oANIDXaOtkYbegNp42/11V83GSUBHy/gZTFBLzDwxff/qji2mIcAwaFTRYI+
	 iwE4jOBiE3XAtb/+kdXJlqpaQ+S8SYc7WRHfmC/JyLu6MfExrzZy+AfBsTSw08/1Xz
	 dl2QdCwOFDvTDpsL7sc38km2ZKn5NsROADXmuLmW6f+DpDJziAn46pQCMzBcVPheRa
	 UPMyOCHwxq/wA==
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a724a8097deso187240066b.1
        for <regressions@lists.linux.dev>; Fri, 05 Jul 2024 04:06:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWcBdxFIe4keCUukj69kJTE5sz/6vYrJHnAqYXgtPeINUHsiU3/Dkrrge+Nc/YJZT84WPQYnTgSBUBNYnDwhfAZrHJLdEg3tQPofVE=
X-Gm-Message-State: AOJu0YyV4Us3ATgKseMEhJNf8Yeqk6fFZRN1fWFJLVHDKpWc5FSsZNFB
	YnSr2ub92r/nVDaXcp9/s+eatjQkKYuTFayBVcisHUdy05+16Ov8OvltNCP6T4+OymYl7l7rbYc
	LWXjSSi8QdMaO/4JALtxe7H7iRhA=
X-Google-Smtp-Source: AGHT+IH64c+v1szNlZ0nWhKoen4VTG9k6IK/Oj+q+L+IPrB+lOM0thHysuOIn7Ff3Wm2h1RYlJynnym5RR6NAAryEa0=
X-Received: by 2002:a17:906:34d3:b0:a6f:b58f:ae3c with SMTP id
 a640c23a62f3a-a77ba468a2amr307138466b.26.1720177601984; Fri, 05 Jul 2024
 04:06:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CABXGCsMmmb36ym8hVNGTiU8yfUS_cGvoUmGCcBrGWq9OxTrs+A@mail.gmail.com>
 <CAL3q7H4yBx7EAwTWWRboK78nhCbzy1YnXGYVsazWs+VxNYDBmA@mail.gmail.com>
 <CABXGCsMWYaxZry+VDCgP=UM7c9do+JYSKdHAbCcx5=xEwXjE6Q@mail.gmail.com>
 <CAL3q7H7Xb9FQx-5PMQtK_-reMq-cbfysCx6s-ZOWL1FUPSm8sA@mail.gmail.com>
 <CABXGCsP9tSwgR4dN-k97maqHB1KOtykakmHNz78SYbAuHydUTQ@mail.gmail.com>
 <CAL3q7H6vG6PEKjcsXtSuq=yks_g-MczAz_-V96QSZCs9ezRZpg@mail.gmail.com>
 <CAL3q7H5RC6dinsA2KLtus07jxDuY1PecPXbhYOWtW+nVyzXwuA@mail.gmail.com>
 <CAL3q7H4MiarsqxSMc0OzY2TNRk8J7Lg+89MaPHY2+NPO-EcDgQ@mail.gmail.com>
 <CAK-xaQYYx6SPQaOVwL+ardB0y5LzYJw9a_hfWWtVEZ=y1rXq5w@mail.gmail.com>
 <CAL3q7H74jpSoMvvkSvmrtB_VGiscz8zN5aHnApWuYU+hpKe+rA@mail.gmail.com>
 <CAL3q7H6V9M0B4jmW79keUtTdjWsabyWZeU5g4KEN5_-a+wEHVQ@mail.gmail.com>
 <CAK-xaQZ=c7aociwZ5YQreTmT+sBLGdH0rkTKmFzt4i_mrXBmgg@mail.gmail.com>
 <CAK-xaQb2OrgNOKKXp8d_43kqMNyuHxS1V8jSDL6PdNZPTv79+g@mail.gmail.com>
 <CAK-xaQZ25nyCeOvMs0G31sL7R71dxQqZhx61cYzTK7rZD-JxeQ@mail.gmail.com>
 <CAL3q7H4D8Sq1-pbgZb8J_0VeNO=MZqDYPM7aauXqLHDM70UmAg@mail.gmail.com> <CAK-xaQYwgOKkeD4HvMtNqNqqchW4aS2gtvzGJ-yKwfE6uaUYng@mail.gmail.com>
In-Reply-To: <CAK-xaQYwgOKkeD4HvMtNqNqqchW4aS2gtvzGJ-yKwfE6uaUYng@mail.gmail.com>
From: Filipe Manana <fdmanana@kernel.org>
Date: Fri, 5 Jul 2024 12:06:04 +0100
X-Gmail-Original-Message-ID: <CAL3q7H7MP7HQbyMpGgRrG+rejQX+5Hc7ipPNPN_tjbaUzNBNGQ@mail.gmail.com>
Message-ID: <CAL3q7H7MP7HQbyMpGgRrG+rejQX+5Hc7ipPNPN_tjbaUzNBNGQ@mail.gmail.com>
Subject: Re: 6.10/regression/bisected - after f1d97e769152 I spotted increased
 execution time of the kswapd0 process and symptoms as if there is not enough memory
To: Andrea Gelmini <andrea.gelmini@gmail.com>
Cc: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>, 
	Linux List Kernel Mailing <linux-kernel@vger.kernel.org>, 
	Linux regressions mailing list <regressions@lists.linux.dev>, Btrfs BTRFS <linux-btrfs@vger.kernel.org>, 
	dsterba@suse.com, josef@toxicpanda.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 5, 2024 at 7:30=E2=80=AFAM Andrea Gelmini <andrea.gelmini@gmail=
.com> wrote:
>
> Il giorno gio 4 lug 2024 alle ore 19:25 Filipe Manana
> <fdmanana@kernel.org> ha scritto:
> > 1) First let's check that the problem is really a consequence of the sh=
rinker.
> >     Try this patch:
> >
> >     https://gist.githubusercontent.com/fdmanana/b44abaade0000d28ba0e1e1=
ae3ac4fee/raw/5c9bf0beb5aa156b893be2837c9244d035962c74/gistfile1.txt
> >
> >     This disables the shrinker. This is just to confirm if I'm looking
> > in the right direction, if your problem is the same as Mikhail's and
> > double check his bisection.
>
> Ok, so, I confirm. With this change, just a little bit of PSI memory
> sometime (<3%), but no skyrocket. Also, tar at full speed.

Ok, so the bisection is reliable and it means you are experiencing the
same problem that Mikhail reported.

>
> Now, I'm going to prepare the btrfs image to send you.

That might not be necessary, not sure how it would help, the 2nd patch
to try would confirm if it's any fragmentation causing too many slow
reads after extent map eviction.
So save yourself some time for now because making the image is likely slow.

>
> The other steps later.

Thanks!
