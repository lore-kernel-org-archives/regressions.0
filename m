Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E20B818B1A
	for <regressions@lists.linux.dev>; Mon, 15 Jul 2024 18:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721067963; cv=none; b=nk08LuMbyzaPq/Lkix+NsZh43KxaCY2YDnBSfjItkHhbqUt3bHRepjCKnZCp2xuMUpgMfgZjiPUGRJcv2XvjxDzSGf8d2ZQI3OhxY4jnJYf6JAiT1k417u6mEGOOw+YIp33bfk1VDsaZJTAIAN5zANEkooB4j/+thWKg9TC01NA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721067963; c=relaxed/simple;
	bh=SNgfukte9/uRetp/NJ+Lof07eu2F4LkCEzuufrYExIA=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=kEHSs91IrjMqrjTtqMHtFh5CWjbl9pLEeiFM1toMoP2UPrqzSiziUMmSj9oNeBXi7nf14EKe1xdxG12wZMa4QXh1EDnwtMwTB7LY9kUmfFwcspTeUqfhmk+09j+5rWMTmXYXrxLXi5C9sXhZm1Uqzfvm6+3zLRWExy4XgXJ5m2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JxcsZPzG; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JxcsZPzG"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-7515437ff16so3247376a12.2
        for <regressions@lists.linux.dev>; Mon, 15 Jul 2024 11:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721067961; x=1721672761; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=SNgfukte9/uRetp/NJ+Lof07eu2F4LkCEzuufrYExIA=;
        b=JxcsZPzGm/vMFrX1U3x6E6f0WNFVGz3oGnHw1KKYdCxBu0JUiQ2ZEChiJqcHlU4Dwv
         a8PEtRiBIrcMTKT15gxdGu5nwidxRLQ+kF5VMpNWnEwNM0c+BU1kRsqxH58UKX0VHvM8
         fFyM5T2CnB66pbcKpbRsbbgNr6zxsjVGRNycAnJt/YUIdc8h7YotISyQEu/ATrcRGxUO
         mRQ4IfQNSPy3HB/8IHKGllDuo3vOsY99nV1j++eNLzi1vKPePpqgGNFenlOFYOm3+I23
         bWfZS4rckz4AnFHZ6UXXbL+qNv2uJA4wpt1cpCHC5c/p8aaCrOQS52bd3+BOtxCqm+f4
         8Lsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721067961; x=1721672761;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SNgfukte9/uRetp/NJ+Lof07eu2F4LkCEzuufrYExIA=;
        b=K1juP7M3+pSz8VkDna5pwQDrg49Jm2QdvWbtNVK+cdKpFdlezKrs47vDP1xFnfIiLT
         BQ+KVCVjs5p2oLGXcBfxQPUYyTuiR3ZrNO67sVAe3p+wWsEgFIU3CtDQ4E5ClNIS/Kg5
         zUd7BoKrDkZAXHZk78DfRguNpjk/nKBhSAmM/m5nnUFW28FvQi1+PO03xIQktazN81TT
         WwuTtwpfCsg0oKKZv6laly1oWr/GV5ab4oAtxcYL3arvAfhkJ1xsFo1VZbqiMHVKFDTD
         a92YTpA3hARg4RMyuZu6cEQm6euLoPhQzDisdYINOx+VTIfmxZvyQ555dNgD1VSViaqV
         2PFw==
X-Gm-Message-State: AOJu0YxF+5ahPA3xqHViwmdC+uPjsT1KK5lM39JfoC7gYZO8fb+SkzCx
	wUmMmJtWj0y8qKisDTzvpEuug6wRGv5TDxVHsc0+N5sa4GRHhC/QfKl6ffZzLFArWdZJqXq3gau
	yI41lTHlTtN6il/eD0073fN5m2Ylg4+Wr
X-Google-Smtp-Source: AGHT+IFdCM5h2xkxqxaJHmr1rY95kUahL0tlirCSlgR3AU4Kn/sv936BtoUbAHh+Maq5D13B2VG/1wjmR2TB/OGvpSc=
X-Received: by 2002:a05:6a20:1594:b0:1c2:8b78:880 with SMTP id
 adf61e73a8af0-1c3ee59f9b5mr816300637.41.1721067961251; Mon, 15 Jul 2024
 11:26:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Robby Knipp <knipp30@gmail.com>
Date: Mon, 15 Jul 2024 14:25:50 -0400
Message-ID: <CABSVwikkDqE=XSXfiv=F6N4tE+kpNENxhPsP4gqvm1jg6D6cAw@mail.gmail.com>
Subject: Re: Xinput Controllers No Longer Working
To: Edward Wawrzynski <ewawrzynski16@gmail.com>
Cc: regressions@lists.linux.dev, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

I have created a bz for this issue as well -
https://bugzilla.redhat.com/show_bug.cgi?id=2293600

In my digging, it seems that the 6.9+ kernels do not have the xpad
kernel module (running # sudo modprobe xpad returns no value)

A workaround was to manually install xone or xpad kernel module and
self sign the key (keeping secure boot intact) however, this is
somewhat tedious since it did work before.
