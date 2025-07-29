Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8A22230BE9
	for <regressions@lists.linux.dev>; Tue, 29 Jul 2025 05:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753767250; cv=none; b=o7uQ5NMEu0JLtO1M/EF1kLIdgQVdH1ecOIBZEJGH/JvlF/qvpTsl7pZmZ+L0bwO9LAQHvBOsZpx9sZYzIcOhb9G0JtFaiugR0h/ivoXHIHaAhkRU1DbaIawIyIjwBBlfm6d8G7V6cB68og3iYxctppIglgcirsjkVhiydQy/iaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753767250; c=relaxed/simple;
	bh=qKAC5DW2JQ8V1S2ikGUaLAAv7w7fEROv695RWUPOfNI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aE0QH1/5vsAyHCJzWfsNBY/rn8bcyW9RjUMDjHZ43t03B57y8DVQXXNRqReqo24RipYRuQPCshW1YqdqfveBuOKoTQIxeRmM+jGKR9lsgK5VXbTstgpLRomWptJwoytQlTHKnnabB53E8SyAg4OCWQrJy0eQJDjGo9EE5OI4Ca4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=FaBqiX9i; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="FaBqiX9i"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-60867565fb5so8053832a12.3
        for <regressions@lists.linux.dev>; Mon, 28 Jul 2025 22:34:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1753767247; x=1754372047; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=D6p1/M8lR2WSDDU9YBd8I/6HRm8nPQPg6ynn7GwgSIk=;
        b=FaBqiX9iTqPB0M6/VNfUz+khD4d95gz7TAclVvhhd5eIaD757Hx1pwAfMpEfbC5gH9
         n05S3+Ynd3CFgqIT2GqwMp2z6Um23imSV2MaLZC15rIzmcorj1Pxwp4yNwPHGZwumT4g
         FPrtwjkJm5BFbhOERlxuQF5BgJ/Js7P6a0nVo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753767247; x=1754372047;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D6p1/M8lR2WSDDU9YBd8I/6HRm8nPQPg6ynn7GwgSIk=;
        b=osFRq1HEPl57HflB7G1so9r+Y6cR6kMhw22qDAxvrZd9T0NNwZA8ATQuXo6CAFH2/i
         VON4g7JvrkX/tfqcCzCqCbrNcKPX1vNfk19m2SUwPq5pQ8BZnGsQ6TY/w07bODaQHKVC
         PoTFEp70UyOKDzSQu4PLY/jQNIWB9qk6Kuy84JLHiRkoStcuF+hUVA5OeHLc/b0guKRz
         Ay00754Ot9hC90aReUvWrwPn9kaZJMC1B5Md9HxtbWBQoKJb/qaIGcfUwPyE90BfRNVy
         vdEbv9auSM6KvYW5w8hqF8XjBv9SRmSgTzqTX4Q08LgWYfofV02P6Qs3CgwO1eRS4K0m
         mV5w==
X-Forwarded-Encrypted: i=1; AJvYcCVevHs0cRtgJDM6qJY+lRD7873Fd1GMbKu2vwOEjr7gkYgp0/SZbxg7FYt+MxdWBkFbtX+pO9+YlMTjEg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzgZS+A+e+neAi1ywlCgNOkNzp+D8KCV9D5X04cR/KlaoGuOLIg
	+KzWydch9aZEl3eN41djriVBqke6WN9gVEITB0Db0KgpMPYiaeqQSjZ+uHBG4fyqjgUDbSbOxM0
	bI4Z4hp4=
X-Gm-Gg: ASbGncu1Bt7ChEqhkPbuHHhc2+keTxN9iR8oKog+yaY+PeiiEPnTEsAZ/f4DxBSTsik
	w+Q686f118telrUofWubLcXpRLGQ0TZgle3lHL9TUEYLVlK/iMGp9FwSlHF0KRz53bL4mInirYB
	waq7lkK4Mw0Vc3/MV241PAywnR9kmxDdh+sC0GpkPUnpIcIFk5Kc7Xfa2P22zkf6P82vWoqZ8/t
	Uw6XL5XCoW1b/l6TMbX3jqkdF70uPcydMaCFc4Qnnic3Jdoez6mXx1tSqIFJTVm0wW4OgUsYhV0
	Wqm56LtxpSoPoVJdlzIzdR7BG0r3cAj3KnrTOy8xmwFaOktfUuD0xpVb+uoOv8W1QeQCvpRbcps
	sMF0lJb7TtW5rtbRu3BKtGJo/z8ksAsTePShv2fwAOOglFnnSL7AqxAQz7goVWmWoevn8OOrX
X-Google-Smtp-Source: AGHT+IEUzo9qTZS4+rXYtAmbtHzQKx0dM3y/bnLO/DSIquG7bU1YbpJu2S5qq4coC7rEC8RO8/wTjw==
X-Received: by 2002:a17:907:7e96:b0:ad8:87a1:4da8 with SMTP id a640c23a62f3a-af61c9a5602mr1587414866b.14.1753767246916;
        Mon, 28 Jul 2025 22:34:06 -0700 (PDT)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com. [209.85.208.50])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af6358600b1sm538205266b.7.2025.07.28.22.34.05
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Jul 2025 22:34:05 -0700 (PDT)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-60867565fb5so8053795a12.3
        for <regressions@lists.linux.dev>; Mon, 28 Jul 2025 22:34:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWN4p6sZreb9WW+wpLzMrPT4DS353CbOiDtts6NndIR3v3W50ti8NBHrtXYAQ3DM1GnwWlU3v0WJjoQHg==@lists.linux.dev
X-Received: by 2002:a05:6402:560f:b0:615:78c6:7b12 with SMTP id
 4fb4d7f45d1cf-61578c67f57mr138067a12.30.1753767244941; Mon, 28 Jul 2025
 22:34:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAHk-=wh0kuQE+tWMEPJqCR48F4Tip2EeYQU-mi+2Fx_Oa1Ehbw@mail.gmail.com>
 <871pq06728.fsf@wylie.me.uk> <hla34nepia6wyi2fndx5ynud4dagxd7j75xnkevtxt365ihkjj@4p746zsu6s6z>
In-Reply-To: <hla34nepia6wyi2fndx5ynud4dagxd7j75xnkevtxt365ihkjj@4p746zsu6s6z>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 28 Jul 2025 22:33:48 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiy=vZu63bfD8uJ6wSK8Pw_vsz-Fe2=WjFLGa_f1JnFWg@mail.gmail.com>
X-Gm-Features: Ac12FXwMXGQ8qR47Of_hZzjFq_Xr2vB0JGiqe4Uq_C-qLobzrwFzNBbnC87IKqQ
Message-ID: <CAHk-=wiy=vZu63bfD8uJ6wSK8Pw_vsz-Fe2=WjFLGa_f1JnFWg@mail.gmail.com>
Subject: Re: "stack state/frame" and "jump dest instruction" errors (was Re:
 Linux 6.16)
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: "Alan J. Wylie" <alan@wylie.me.uk>, linux-kernel@vger.kernel.org, 
	regressions@lists.linux.dev, stable@vger.kernel.org, 
	Masami Hiramatsu <mhiramat@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 28 Jul 2025 at 08:42, Josh Poimboeuf <jpoimboe@kernel.org> wrote:
>
> The problem is likely that CONFIG_X86_NATIVE_CPU is using some
> AMD-specific instruction(s) which objtool doesn't know how to decode.

It might be a good idea to add some byte printout in the objtool
'can't decode instruction' error message, to make it easier to
immediately see what code sequence cannot be decoded.

> I don't have time to look at this for at least the next few days, but I
> suspect this one:
>
>      1a3:       8f ea 78 10 c3 0a 06 00 00      bextr  $0x60a,%ebx,%eax

Hmm. We do have BEXTR in our x86-opcode-map.txt file,:

  Table: 3-byte opcode 1 (0x0f 0x38)
  Referrer: 3-byte escape 1
  AVXcode: 2
  # 0x0f 0x38 0x00-0x0f
  ...
  f7: BEXTR Gy,Ey,By (v) | SHLX Gy,Ey,By (66),(v) | SARX Gy,Ey,By
(F3),(v) | SHRX Gy,Ey,By (F2),(v)

but there's apparently two different versions of 'nextr'.

The one we know about is the "BMI encoding", but there's also a TBM
encoding ("Trailing Bit Manipulation") that AMD introduced for
Bulldozer, and it appears that we don't have those in our opcode maps.

And yeah, I think it's bulldozer-specific, which explains why nobody
sees it (because bulldozer was one of the not-very-great AMD uarchs
before they got it right with Zen).

             Linus
