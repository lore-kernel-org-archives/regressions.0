Received: from mail-io1-f48.google.com (mail-io1-f48.google.com [209.85.166.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2331517997
	for <regressions@lists.linux.dev>; Tue, 21 May 2024 16:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716308193; cv=none; b=sqg5PRw3AQc8IIay/8h1najxCgmDCdelP71aB91Y94dtz5x/KvVg9AUwrOpaeog+9TfonHE2m4M8ePXG6rYMGiq2duzQtSV9LiJXQMMFaD3/FLvhSVdonyIjLySEwpUUtDNUsuk1EK+B0B5Mn1PedmcwwgU8NEZIgRIqq0NJmYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716308193; c=relaxed/simple;
	bh=qjBVA8ggLNmGa0E2b6IVKynsyFNB2lzDbYb/vF/UBE8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JWFmmVuLwUAhaSVg8NiCJmbJsczl+gkHkJdyTEhnKkI8v6erp+ITdkW0wkDiyMWIDFo96tJeJYbz8miR9RMK9wnhhUV5vzwWkwul2qunL8QKDQl2jg873hId5u/G3gd2kvAIH1QTo4Jp+eMjd0bii7fIhFKR+x+zPTyZKjkb8E4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=ooKlNTXy; arc=none smtp.client-ip=209.85.166.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="ooKlNTXy"
Received: by mail-io1-f48.google.com with SMTP id ca18e2360f4ac-7e195fd1d8eso19408239f.0
        for <regressions@lists.linux.dev>; Tue, 21 May 2024 09:16:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1716308188; x=1716912988; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VPlnRVU+taSPs3KUAXhcI2PpqAt76JjV3d+nQlsudCE=;
        b=ooKlNTXy3oRHJ9HoaFyjoRYwa4kEQmcA5vGhXwvWjUn0FDTpv/h6xwwoM4tXNmoB5B
         +rlTkScrELuurZ5S0oOPt6EaZkOce+z3yI0Z1DrdiO0vMqn2lTNqOZ7puO1u4JslNJ53
         jaL8zqGSW24v4+DK/5FYOYso4Gm8pElnQ45OmTzH0HrHWc6ekpw2zKA9jionlG4sKC+I
         LYyVP/sLG0exjKVjInUS2o94I/z4EXWVK6L6C5MbcUCFTgfp7/KfB+0BrmSdSMB5Kwke
         gwrhKL+U7xY0PbCQFCn48AMnzYLCosnKzH1BHAhbiXSiDVwVH5xwnA+vH7sYzP3fxod4
         H4lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716308188; x=1716912988;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VPlnRVU+taSPs3KUAXhcI2PpqAt76JjV3d+nQlsudCE=;
        b=sC4Oxd3u6FYyxHTWduGaPaPOqeCSQFekeYigJjqFIfF54Howhh+sqqtfN6WH829DTB
         642i6qJjXBBL7ApU4NhWZRiiNjYdX8fCDqQWlpJqEFadoY5cJYsOODYVw2zlsupkqchC
         1WrGGFV2UWfgoe8blkgD/+FeUtZ1RSzo2TphCDigQdZ2I8x+KXABiDPassRQRigN+/2K
         mCy5JJYTq9qWY+mm3DiC+rtvFWnkP8/vZAlXaFQhOrlHIJ3M+/DMy6w7bWl5u5Y7WB7S
         pdAJbenCu88PivlzE+qfgQqC8PEJE0Kl4b/kxVrRdtDaVBk3zytwypLSXV85JS2PYoyQ
         TftQ==
X-Forwarded-Encrypted: i=1; AJvYcCWI2zeTCYlyhluxXYZbLZlbheErYnckggKIeFJbEVNXy05LU5bbMw9QzTAaUAafZs57aUl+EC0FN9Jl4qWZ9xD/q3BZkh7SC7pCcZs=
X-Gm-Message-State: AOJu0YyTx9lmreD+qc7FzInuKzyjch7prwX8W13dWZJI1HIUNqeO34v9
	v5/aCl9gw6Cu/WCYuqdhf9Xha/dumq72Ai7QkpSRkOKCTyDuhI8x31h1RBU8T8Q=
X-Google-Smtp-Source: AGHT+IE3hXU7Nbrl5o9NXAKpyjo2WFIT5cKrhXoGADD9AqeueOOV2X7KdFSsHAqSHS2D9/aObYkyPg==
X-Received: by 2002:a92:d40a:0:b0:36c:c4eb:fef7 with SMTP id e9e14a558f8ab-36cc4ebff44mr293860395ab.2.1716308188166;
        Tue, 21 May 2024 09:16:28 -0700 (PDT)
Received: from [192.168.1.116] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-37073b59f96sm5620305ab.53.2024.05.21.09.16.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 May 2024 09:16:27 -0700 (PDT)
Message-ID: <8979ae0b-c443-4b45-8210-6394471dddd1@kernel.dk>
Date: Tue, 21 May 2024 10:16:25 -0600
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] ETXTBSY when running Yarn (Node) since af5d68f
To: Andrew Udvare <audvare@gmail.com>, regressions@lists.linux.dev
Cc: io-uring <io-uring@vger.kernel.org>
References: <313824bc-799d-414f-96b7-e6de57c7e21d@gmail.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <313824bc-799d-414f-96b7-e6de57c7e21d@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

(removing stable as this isn't a stable regression, and the commit
itself isn't marked for stable to begin with).

On 5/21/24 10:02 AM, Andrew Udvare wrote:
> #regzbot introduced: v6.8..v6.9-rc1
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=af5d68f8892f8ee8f137648b79ceb2abc153a19b
> 
> Since the above commit present in 6.9+, Node running a Yarn installation that executes a subprocess always shows the following:
> 
> /test # yarn --offline install
> yarn install v1.22.22
> warning package.json: "test" is also the name of a node core module
> warning test@1.0.0: "test" is also the name of a node core module
> [1/4] Resolving packages...
> [2/4] Fetching packages...
> [3/4] Linking dependencies...
> [4/4] Building fresh packages...
> error /test/node_modules/snyk: Command failed.
> Exit code: 126
> Command: node wrapper_dist/bootstrap.js exec
> Arguments:
> Directory: /test/node_modules/snyk
> Output:
> /bin/sh: node: Text file busy
> 
> The commit was found by bisection with a simple initramfs that just runs 'yarn --offline install' with a test project and cached Yarn packages.
> 
> To reproduce:
> 
> npm install -g yarn
> mkdir test
> cd test
> cat > package.json <<EOF
> {
>    "name": "test",
>    "version": "1.0.0",
>    "main": "index.js",
>    "license": "MIT",
>    "dependencies": {
>      "snyk": "^1.1291.0"
>    }
> }
> EOF
> yarn install
> 
> Modern Yarn will give the same result but with slightly different output.
> 
> This also appears to affect node-gyp: https://github.com/nodejs/node/issues/53051
> 
> See also: https://bugs.gentoo.org/931942

This looks like a timing alteration due to task_work being done
differently, from a quick look and guess. For some reason SQPOLL is
being used. I tried running it here, but it doesn't reproduce for me.
Tried both current -git and 6.9 as released. I'll try on x86 as well to
see if I can hit it.

Maybe someone can describe what is happening here? I'm assuming that
something is racing with an io_uring operation done by SQPOLL, which is
keeping the file open until done.

This may or may not be a kernel issue, depending on what assumptions are
being made on when operations are begun and completed. Maybe those
assumptions are correct and there is indeed a kernel regression here, or
maybe the user side is just buggy in its assumptions.

-- 
Jens Axboe

