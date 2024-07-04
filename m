Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4652E1B1205
	for <regressions@lists.linux.dev>; Thu,  4 Jul 2024 14:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720104529; cv=none; b=KmHrPBqz7jYcZkU6D9xHOLMEJyG4+AURVCoMpmqsOkxXF3Jxq+PiscNZtyxnARjsP0MgIx7xGR0imdRupXG+9BflxpKx7uHCd5OOXbAlFl+ecoIjgZ7Pv4B81zON78JW7Q0ZdUCYkBsIiJVxEUEugU1SVIyZsYZPgJOzKYqnQJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720104529; c=relaxed/simple;
	bh=hTQ5+Ju5PD+FvRF1hnYejUZPbE8kNPGJFeDeitAPK5o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=poaEF9WOKSouT3nW1rR7BMCzH4s00X9qi+r/3H74ChKsN/OKk1OdriRyL3IgRq/I6wN+Fr/pmqEjk7bb5VD3oGqahmI+fvhFsDtn2LRbuMDT93mhPgSijCRtNIvwL0vn0pHraTlUrtt7JLZb1gd1mL1gjYhPxCrGqH16KTwZgMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QTXPfQb+; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QTXPfQb+"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-64b29539d86so6269597b3.2
        for <regressions@lists.linux.dev>; Thu, 04 Jul 2024 07:48:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720104527; x=1720709327; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cp5edY4coh4CGekIA4INUCYnmNceA0sPbADqg4C7PGY=;
        b=QTXPfQb+NR8gOhxiNsIHOcivNu2+SB+ZQA0VqnzCIFLW+ASmlAQTLQO8ua52eL9NDf
         oX3Ryaj4DuFKMaco2mVLIc0HpHma1VCQMZijcIgUaoy0lclDjx30nMBy+rrTNhOC/VkB
         ODYmyKnH7fjiSycGFjEE5aOcrmJCKXm/6KB5QVwg9o0I/smZUnWiCW9BdmjPczgftzCM
         Kn4R5QaRP7ZXlbbwDFmUEvFV4eHGwiegNYETw6rp6V+3qoNNMC37kHOibOlGTwTtdN96
         fctvNXhCmaUOreuBu0ln5MsNc7XdYQoYrO8aCMEed23uan9/66RgmzxWYvnZF0RXVrJK
         BSWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720104527; x=1720709327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cp5edY4coh4CGekIA4INUCYnmNceA0sPbADqg4C7PGY=;
        b=h9euPhzjYkP5CdEXqdPrlamrL8UO0+dQab15c2DdI5NP+yRQ4fxBUDub2AYfKEpASU
         tDVoQnQvvckPFcN8druQkZwkKOTDr7/MOiTYInwYjU+8gCgOHO8X+wBQLIPwpRAXp1TZ
         bapadHZqc0EVH+sB9q17mq87jkQgJSv4Uqnr8xWpd2M1ctd3u8r3SA48Ee9soewqlcHk
         H+dcOnmlN4TrukJvXUUw4OtmPWe7gzbQ2wlU44BeMoqnoeKMpeZkSt7eRRjDPkOu5SRM
         ZuADcAyfp3uKPhjIp+M+CPeYRn2P0CR5ZhdRidj2ev96lO1FUYTVfq3vZ3kUx8X7DQBb
         Cy4w==
X-Forwarded-Encrypted: i=1; AJvYcCVTre4KVNQoMPEPqwRL3locFJTxpos9KAuHUgD9Q9RNUJoufUQGSjLrdcMWnhLjOTBD/JLumbLZ4vPWkpGSunYhwgtqWe+T2HG55ks=
X-Gm-Message-State: AOJu0Ywg3IQHA5cXjyn/EDf8uIQKaW07VJJo79KxoNgTA0k9xcVo+dqf
	TcM/Hqd9eUpPMXzeZzZr0k6he6X0nhQu5qKVh7F6xg+Nf5OedfUo1wdRXWujXcvFZY/hma7/GuH
	owgBgT/ridFLvjfid5J9CDQA3hJg=
X-Google-Smtp-Source: AGHT+IHPh8VBc7TGunrBIhkcZ45omy48LyXKyt7ZQZfzz/Ure6Rsthc0HV+ttveS0aTA5+Sur0JRJSuNsRm78pF9IDs=
X-Received: by 2002:a05:690c:4d82:b0:64a:9832:48a with SMTP id
 00721157ae682-652d29025f0mr24371487b3.0.1720104527343; Thu, 04 Jul 2024
 07:48:47 -0700 (PDT)
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
 <CAK-xaQZ=c7aociwZ5YQreTmT+sBLGdH0rkTKmFzt4i_mrXBmgg@mail.gmail.com> <CAK-xaQb2OrgNOKKXp8d_43kqMNyuHxS1V8jSDL6PdNZPTv79+g@mail.gmail.com>
In-Reply-To: <CAK-xaQb2OrgNOKKXp8d_43kqMNyuHxS1V8jSDL6PdNZPTv79+g@mail.gmail.com>
From: Andrea Gelmini <andrea.gelmini@gmail.com>
Date: Thu, 4 Jul 2024 16:48:30 +0200
Message-ID: <CAK-xaQZ25nyCeOvMs0G31sL7R71dxQqZhx61cYzTK7rZD-JxeQ@mail.gmail.com>
Subject: Re: 6.10/regression/bisected - after f1d97e769152 I spotted increased
 execution time of the kswapd0 process and symptoms as if there is not enough memory
To: Filipe Manana <fdmanana@kernel.org>
Cc: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>, 
	Linux List Kernel Mailing <linux-kernel@vger.kernel.org>, 
	Linux regressions mailing list <regressions@lists.linux.dev>, Btrfs BTRFS <linux-btrfs@vger.kernel.org>, 
	dsterba@suse.com, josef@toxicpanda.com
Content-Type: text/plain; charset="UTF-8"

Il giorno gio 4 lug 2024 alle ore 15:47 Andrea Gelmini
<andrea.gelmini@gmail.com> ha scritto:
> I send you everything when I collect enough data.

Here we are.

Kernel rc6+branch:
    Output of bfptrace:
    https://pastebin.com/P9RFp5mg

    Recording of tar session: (summary: start fast, then flipping super slow)
    https://asciinema.org/a/BxYI83TkrlOhEe42IWXNY135D

    Recording of htop session: (summary: PSI high and two threads at 100%)
    https://asciinema.org/a/ZwGSepZZ8TSpFfPssACUUXcCB


Kernel 6.6.36:
    Recording of tar session: (summary: tar always fast)
    https://asciinema.org/a/a6dOkbjyPFkkQ5aNTaRiFD3H8

    Recording of htop session: (summary: no threads and PSI load)
    https://asciinema.org/a/mFsypWzHfSdsjrIQf8zpzNpKo

If you need to run for longer time, I can do it in the weekend.
If you need dump of my BTRFS fs, no problem, but I need 'btrfs image
-s" working (point is: scrambling filenames).

Thanks a lot,
Gelma
