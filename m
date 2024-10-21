Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A4031FBCBF
	for <regressions@lists.linux.dev>; Mon, 21 Oct 2024 18:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729534027; cv=none; b=SHzr3HYDSG30NZOCbU6cs5HPU8Ws8FeOELdUBrvUsc1RotBLBkF0avPFAxByWZTBxjyQzVYwxlfhOipIm4/ZqUKzA6kz99Pbvv/0ozRydABiT0mt9v0Z1S02/FEdAfSCwvpR1s4PzvQ5Zml+Bwl0rC9cddnVPMntp7cEmjt7C8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729534027; c=relaxed/simple;
	bh=M4kM5lUArydv5dJlC3xGAgRG9sLdyI57ghLl58KLUck=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Se2msG/MgUA6HVjV4YAcvSfkGYjrAZlMGdlx7c8fnEJSuqKbzA27OLTXuxV9yap2MBG5lMuq5TB8MyrtcHH0JGoVZPFTcQbkk7/UDkK9BtCaqyYXJp02uAA0XK+x3gFsUdWv7dECsgdXnAo1TOSNiV19ou3zyzlhhsxEnsd8vGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=WI+CxzN6; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="WI+CxzN6"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2fb6110c8faso48662561fa.1
        for <regressions@lists.linux.dev>; Mon, 21 Oct 2024 11:07:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1729534023; x=1730138823; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Vxq8+fnWQoCNUD9nqgZ6L3cBMv3ogByZUUYEqazDFpU=;
        b=WI+CxzN6nDPOwH70KJQSD2+KFQ2nBGq+Gjt4a/T7tWp+GSZmGUCkkYVlUADm8ecsoY
         mZt7vqDkpnn6w57bjNH7EH+q9PEXTUR5TX3c3HbdZABdGUPzzNsrrRpw35aqWv6w4WIn
         adcKTGJzNCY7XHZiQA+mxubb9mFVoFJNab5c8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729534023; x=1730138823;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vxq8+fnWQoCNUD9nqgZ6L3cBMv3ogByZUUYEqazDFpU=;
        b=mtJ+9JhUqRj4xX7vqaNOhQxhnqAtoJF+OAucR0gmFqwDzZsxszh/zlBIU3EA6ICG/S
         VagftNoPtYE/DIt9CzCXxJA4nFIITXjG9/9kI13EhV/JSgUkzLZKQIuJbWQijhkvZqDS
         qoZV07fKgaJxzCa33/0IdLyk2n2Upj2W1vruiAHPbZwrPe5OOW4lsBXfuEs+xO40e6s/
         AWu6VbbWQ1QyHd+lfGHq4sjaePtQDSvotLdJp8RY8AOz5E74clfVQq+O5QiXWWfswKn7
         PTrDJokLqGGMOkj+9FugDKMyA7sTP5G1UAqsUNhq3eQJrOpt5nCxl3wjbOyO9d9C2W/T
         M6/Q==
X-Forwarded-Encrypted: i=1; AJvYcCXLyHbuOkb7lW/GM5b2uaPKxYBdzZ8ubrh7wbXXB4g9EOE9k5bK70qMN75U4uFRLUSjaazPrbINjQvruw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxvKYzOS9ZwWiQ2VsKtwrAGfGce0p1FeH+T7OZ69G2zuH1Lo3B2
	VEmK7RxUOCv8c6eOSYqAuNT8P+uA5+MlyTXrQlyzsQGTZAM0hSf7mdDup9V0cQ8JMBqcnw0D4nf
	VtiU=
X-Google-Smtp-Source: AGHT+IE5GJVU6uF7dxfvDN9psLE/FV1brJ92nTNrU5/Je+Ger8uOeLhTtg4N0haJjpRaMS2UNzGHdQ==
X-Received: by 2002:a2e:4a0a:0:b0:2fb:5014:abf9 with SMTP id 38308e7fff4ca-2fb9b03eadamr22006621fa.31.1729534023235;
        Mon, 21 Oct 2024 11:07:03 -0700 (PDT)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com. [209.85.218.51])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cb66a6a555sm2245105a12.45.2024.10.21.11.07.02
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Oct 2024 11:07:02 -0700 (PDT)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a9aa8895facso49514566b.2
        for <regressions@lists.linux.dev>; Mon, 21 Oct 2024 11:07:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWqH4VnFQdewwpZh3HPEA03uRC6Z6jpgnTzXxztKzHmBJqfx2c6/9wslXZRKlzQo0KH0xtx3PCrEswodw==@lists.linux.dev
X-Received: by 2002:a17:907:1b84:b0:a99:e4a2:1cda with SMTP id
 a640c23a62f3a-a9a69ccfc7amr827335866b.56.1729534022017; Mon, 21 Oct 2024
 11:07:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241016204258.821965-1-luiz.dentz@gmail.com> <4e1977ca-6166-4891-965e-34a6f319035f@leemhuis.info>
 <CABBYNZL0_j4EDWzDS=kXc1Vy0D6ToU+oYnP_uBWTKoXbEagHhw@mail.gmail.com>
 <CAHk-=wh3rQ+w0NKw62PM37oe6yFVFxY1DrW-SDkvXqOBAGGmCA@mail.gmail.com> <9e03dba5-1aed-46b3-8aee-c5bde6d4eaec@leemhuis.info>
In-Reply-To: <9e03dba5-1aed-46b3-8aee-c5bde6d4eaec@leemhuis.info>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 21 Oct 2024 11:06:45 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgQhFPvneqAVXjUZDq=ahpATdgfg6LZ9n07MSSUGkQWuA@mail.gmail.com>
Message-ID: <CAHk-=wgQhFPvneqAVXjUZDq=ahpATdgfg6LZ9n07MSSUGkQWuA@mail.gmail.com>
Subject: Re: pull request: bluetooth 2024-10-16
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Luiz Augusto von Dentz <luiz.dentz@gmail.com>, davem@davemloft.net, kuba@kernel.org, 
	linux-bluetooth@vger.kernel.org, netdev@vger.kernel.org, 
	Linux kernel regressions list <regressions@lists.linux.dev>, Eric Dumazet <edumazet@google.com>, 
	Paolo Abeni <pabeni@redhat.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 21 Oct 2024 at 01:22, Thorsten Leemhuis
<regressions@leemhuis.info> wrote:
>
> Just to clarify: I assume it's the "taking things directly and thus
> bypassing -net" that is the problem here?

Well, it's not a *problem* per se. It's just not something I want to
be a regular occurrence, because then the lines of responsibility get
less clear.

And we've seen (many times) how that causes a kind of "bystander
effect" where everybody kind of just expects somebody else to handle
it, and things start falling through the cracks.

IOW: having clear lines of "this goes here" just avoids a lot of waffling.

So that's actually one of the main things about being a maintainer:
sure, there's the whole "enough technical knowledge to be able to
handle it", but a *lot* of maintainership is literally just about
being responsible (and responsive) for some area, and people _knowing_
you're responsible for that area, so that there is less of the "who
should take care of this patch" confusion.

That said, in situations like this, where some small part missed a
regular subsystem pull request, I don't think it's problematic to just
go "let's bypass the subsystem, and get just this thing fixed asap".

Not when it happens rarely (like this time), and not when it happens
in a way where everybody is aware of it (like this time).

So I think in this case it was probably *better* to just pull a very
small and targeted fix for bluetooth issues, than have the networking
tree send me out-of-sequence pull request that had other things too in
addition to a high-priority bluetooth fix.

Put another way: having clear lines of maintainership is important,
but it's also important to not make things *too* black-and-white.

Exceptions are fine, as long as they clearly remain the unusual case
and people explain them.

(That is basically true of pretty much everything. A lot of the
development rules like "don't rebase" are things where the occasional
exception with an _explanation_ for why it happened is perfectly fine)

Developers are people. Black-and-white rules are for machines.

                Linus
