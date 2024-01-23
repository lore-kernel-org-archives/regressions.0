Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 939595C5F2
	for <regressions@lists.linux.dev>; Tue, 23 Jan 2024 11:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706010411; cv=none; b=rzumCQxQzbFFntsxK3eLdlj3TnXs9i7rFC/wiq3o/q7tACgGv0oeFHk78BZPVkBEQxNV1cbZBS38wpu2Ca1Zhtcfpnwm+E9vvXBkrPFnRqi5jcT4c0juQ0lzMN/OCWa5tx6budb3h5ja6IDWRT++HJrjJI31moBUM1wfQiLKiEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706010411; c=relaxed/simple;
	bh=JfDnCgpZ1rLdrOgkkhaHxpw3ewpX/BXePWtymb5m778=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Cgi7a9i2UGsh3uMKQdyBH9NPoyZbBv9nlTvsBIPciGWc7AfrxY1Gfkj5e16NKEXMTXI9elm/pv6l860LHpZbVKJ+LGctDT+A8+hGfbhmTR1IJwSxSzHFyE1oxbGFHzuMDKNApcIpN0m0BqGyZzfa+OhlgPiQIiRAtl73qdQTCao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ReZKUPh0; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ReZKUPh0"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2cdebb968feso48149081fa.1
        for <regressions@lists.linux.dev>; Tue, 23 Jan 2024 03:46:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706010407; x=1706615207; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8TaiIgW9Sn1shcjlwEwCYruc13n/CneHnu8Td2T3w5k=;
        b=ReZKUPh0zP/e8tveqx9qhoNIwPSviaTjNzZleBXjPIqSuIv+uT0sB2RzdQelaIg5DN
         LSwJdIOL16LTJm4kUrotjAGX+w7XCy6xKvnMAPLeH334hqUeeUivxljLFUvbPE8J5rKe
         1auItFTcYeOMVeRPDw3VkOJ6cwdUbXWaedjn/asdy8k7Ki9yacImBK7HuUl41TPx04B2
         bMMPLbQ2OEW4UCYs+f171YNlr+gS2spow+RiDYbNaHccj3kCnIK84Bgfa/wi0wGa8fqx
         nfstvlXtQcmQ7JT7od6uI7y21BwOfvefL3pJDDz4fEbYItllVib8D8wfvUCL/JqPjVNi
         sMtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706010407; x=1706615207;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8TaiIgW9Sn1shcjlwEwCYruc13n/CneHnu8Td2T3w5k=;
        b=d/nji8/ptlrqjBIUsv8+aYgH3rw6dByT74m8NJ5tlXzj6MlHBEHjJig8CFjG/a4ylo
         4ho5piqdTl+oKV3S7p9tVvVrEjs+bORBMtdgmiS97fqtcb+eeXQpFcUYgEzDQ+Oz74nY
         L4Cpws8AGHeA3reuwhQYrRG4XW6NbSnTVA4MT5qMWzZUsIlMWIYUsnddE3sY/k2lZiQN
         7w7BjBTfehMVlm17IlEAVrWzRrRZcKj9Qi1DoghvmhlkEvOkbKhbUh5MAe2FUTJ0qP+2
         r4wZK/dpSR7vd9kfM7x2HnWoVRUxFYEReZcPbYDNI8IKdnozpviK7skzT591tCq5uepV
         9uww==
X-Gm-Message-State: AOJu0YxWuQVj3aCP2dYeiGYvRgmjbUpPTFM2agotn4ljKVvRCA7p6I9D
	j9Dxcgie8bq8gbxf7oGrgaLJZsRt0phrHT49Dmpr/K4F+eY8+/vVecrFoUz9NGwQZYztu8XOoji
	izvemjh0kYZ02UrfRdE9l5knofRA=
X-Google-Smtp-Source: AGHT+IGarevvMA2GwyFdnOl/o/iJjsdpd801TjZcbbnTbWED5hEeLiZQIWCyPqhwUplXEHevPgRILuZFPSBDDLMstbw=
X-Received: by 2002:a2e:9f54:0:b0:2cc:8bc7:5703 with SMTP id
 v20-20020a2e9f54000000b002cc8bc75703mr2222897ljk.18.1706010407252; Tue, 23
 Jan 2024 03:46:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <Za9DUZoJbV0PYGN2@squish.home.loc> <6939adb3-c270-481f-8547-e267d642beea@leemhuis.info>
 <bbac350b-7a94-475e-88c9-35f6f8700af8@leemhuis.info> <e2f791e51feb09e671d59afbbb233c4d6128a8d2.camel@kernel.org>
In-Reply-To: <e2f791e51feb09e671d59afbbb233c4d6128a8d2.camel@kernel.org>
Reply-To: sedat.dilek@gmail.com
From: Sedat Dilek <sedat.dilek@gmail.com>
Date: Tue, 23 Jan 2024 12:46:10 +0100
Message-ID: <CA+icZUXaxysi1Oq1wKeDZ5LZVp7i585vmPQi67hw1CdW7nGC6A@mail.gmail.com>
Subject: Re: [REGRESSION] 6.6.10+ and 6.7+ kernels lock up early in init.
To: Jeff Layton <jlayton@kernel.org>
Cc: Linux regressions mailing list <regressions@lists.linux.dev>, stable@vger.kernel.org, 
	Linux-fsdevel <linux-fsdevel@vger.kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Chuck Lever <chuck.lever@oracle.com>, 
	Paul Thompson <set48035@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 23, 2024 at 12:16=E2=80=AFPM Jeff Layton <jlayton@kernel.org> w=
rote:
>
> On Tue, 2024-01-23 at 07:39 +0100, Linux regression tracking (Thorsten
> Leemhuis) wrote:
> > [a quick follow up with an important correction from the reporter for
> > those I added to the list of recipients]
> >
> > On 23.01.24 06:37, Linux regression tracking (Thorsten Leemhuis) wrote:
> > > On 23.01.24 05:40, Paul Thompson wrote:
> > > >
> > > >   With my longstanding configuration, kernels upto 6.6.9 work fine.
> > > > Kernels 6.6.1[0123] and 6.7.[01] all lock up in early (open-rc) ini=
t,
> > > > before even the virtual filesystems are mounted.
> > > >
> > > >   The last thing visible on the console is the nfsclient service
> > > > being started and:
> > > >
> > > > Call to flock failed: Funtion not implemented. (twice)
> > > >
> > > >   Then the machine is unresponsive, numlock doesnt toggle the keybo=
ard led,
> > > > and the alt-sysrq chords appear to do nothing.
> > > >
> > > >   The problem is solved by changing my 6.6.9 config option:
> > > >
> > > > # CONFIG_FILE_LOCKING is not set
> > > > to
> > > > CONFIG_FILE_LOCKING=3Dy
> > > >
> > > > (This option is under File Systems > Enable POSIX file locking API)
> >
> > The reporter replied out-of-thread:
> > https://lore.kernel.org/all/Za9TRtSjubbX0bVu@squish.home.loc/
> >
> > """
> >       Now I feel stupid or like Im losing it, but I went back and grepp=
ed for
> > the CONFIG_FILE_LOCKING in my old Configs, and it was turned on in all
> > but 6.6.9. So, somehow I turned that off *after I built 6.6.9? Argh. I
> > just built 6.6.4 with it unset and that locked up too.
> >       Sorry if this is just noise, though one would have hoped the fail=
ure
> > was less severe...
> > """
> >
>
> Ok, so not necessarily a regression? It might be helpful to know the
> earliest kernel you can boot with CONFIG_FILE_LOCKING turned off.
>
> > >
> I'll give a try reproducing this later though.

Quote from Paul:
"
Now I feel stupid or like Im losing it, but I went back and grepped
for the CONFIG_FILE_LOCKING in my old Configs, and it was turned on in all
but 6.6.9. So, somehow I turned that off *after I built 6.6.9? Argh. I just
built 6.6.4 with it unset and that locked up too.
Sorry if this is just noise, though one would have hoped the failure
was less severe...
"

-Sedat-

https://lore.kernel.org/all/Za9TRtSjubbX0bVu@squish.home.loc/#t

> --
> Jeff Layton <jlayton@kernel.org>
>
