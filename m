Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0BA97317D
	for <regressions@lists.linux.dev>; Thu, 14 Mar 2024 19:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710444950; cv=none; b=lhgDQaGAzrAXMZ9vLgaWze24LXjoMmOZvazdasrNtgvf2+f2Z5fJH3gZr5k65bB03oqOsCiUX2sJvaKeDIoGYgUy6MpI8LoD6PMoSwMsvPKG/U2pWjze+JEQ02o56NkF3+g9t3LElINAGN0dyjXwAeTwDQSUF/5WGmqamMJZ4xY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710444950; c=relaxed/simple;
	bh=3Rxcynx0H5QzoAHSHBaaELOKSYM44kiaWaRSgICVEDk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IcXwHgAYfeXnn8VrY4m5Q1PVrUWxBn4qyHsE0+xHLu/5k86Ty3oO61604Tv8rRi1YpRNRcMKN5H5a1B0U1zlBsaaCGmqN0Eu1PYXeSYmGpapmEB8Nly0YVLpyj3yN6viB+hoqeA29YFvzT1seCxn9v2EeQ+X5uUhKMnT0zbdLNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VReS/6zN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VReS/6zN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9606BC43390
	for <regressions@lists.linux.dev>; Thu, 14 Mar 2024 19:35:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710444949;
	bh=3Rxcynx0H5QzoAHSHBaaELOKSYM44kiaWaRSgICVEDk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=VReS/6zNZ1aLwVvcvTW9Y7tjePO5DJhvfoqwljq+2kikReVb/uSHJKvdYhy7pFrb6
	 1/vdrlkM/uIzHS1qaRhmeV+gFRbMd/wYQYkJRleQUuLyCxhYpZpdSJg1k2y+UL045G
	 fV5cQTBb0jU2cq83PlLH2KZ5mv1gqMSjCVxucK/abe3Q5wfOu+w75/p/rj+wygCl3b
	 T5SWQs2BSgbpOg+IGKMwogJrnQXjLoXI9JM5OjGKON6kn/53bmIZE6ANYznFDT6NdQ
	 3EEtk4l+4gORp7ycCz8lBI6GgpOm8Mxy1Mi3I40R+n/VvFae3UmrwuHd653tF3Kyog
	 m8u7kNRbptdIQ==
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2d29111272eso18052531fa.0
        for <regressions@lists.linux.dev>; Thu, 14 Mar 2024 12:35:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVMkOT90Ohh3JRLkcoMApfMVCyItKIij0b/LXnj+CteYQJi8zO+UVazBXfe3N+8OzGjI7Wjitq9Ccs8diiaH/h7a6EQpC8FaOjhRSM=
X-Gm-Message-State: AOJu0YzNAnz6eTyrGjEoTrpDaMeZ+Q3fwzmpGclo2xFDg6JUzghkS165
	4a+9vexXx7Mv95aKLb7+eKb6r4CfFMxkYSNDwV7sLTBQOsi1aLXcuYwSzB/B6V6qeEpVH8tihec
	qp37ABPEqhQNEgzfwNZuzK10u2XA=
X-Google-Smtp-Source: AGHT+IEwnps9//0HdKcTZTraFUrI+fQOtyX8t4Df7pqLnapVn8csrqLB74SDqSDuaJc47XQnHtLFhmTVFUjDc007GDs=
X-Received: by 2002:a05:651c:1025:b0:2d4:67d8:7bbf with SMTP id
 w5-20020a05651c102500b002d467d87bbfmr1687886ljm.47.1710444947967; Thu, 14 Mar
 2024 12:35:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <a99a831a-8ad5-4cb0-bff9-be637311f771@podgorny.cz>
In-Reply-To: <a99a831a-8ad5-4cb0-bff9-be637311f771@podgorny.cz>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Thu, 14 Mar 2024 20:35:36 +0100
X-Gmail-Original-Message-ID: <CAMj1kXF7gaaARdyN=bVuXtJb_S=-_ewAavXHgN4DS36jxK8r6A@mail.gmail.com>
Message-ID: <CAMj1kXF7gaaARdyN=bVuXtJb_S=-_ewAavXHgN4DS36jxK8r6A@mail.gmail.com>
Subject: Re: [REGRESSION] linux 6.6.18 and later fails to boot with "initramfs
 unpacking failed: invalid magic at start of compressed archive"
To: Radek Podgorny <radek@podgorny.cz>
Cc: stable@vger.kernel.org, regressions@lists.linux.dev, 
	regressions@leemhuis.info
Content-Type: text/plain; charset="UTF-8"

On Thu, 14 Mar 2024 at 19:32, Radek Podgorny <radek@podgorny.cz> wrote:
>
> hi,
>
> i seem to be the only one in the world to have this problem. :-(
>
> on one of my machines, updating to 6.6.18 and later (including mainline
> branch) leads to unbootable system. all other computers are unaffected.
>
> bisecting the history leads to:
>
> commit 8117961d98fb2d335ab6de2cad7afb8b6171f5fe
> Author: Ard Biesheuvel <ardb@kernel.org>
>

Thanks for the report.

I'd like to get to the bottom of this if we can.

Please share as much information as you can about the system
- boot logs
- DMI data to identify the system and firmware etc
- distro version
- versions of boot components (shim, grub, systemd-boot, etc including
config files)
- other information that might help narrow this down.
