Received: from mail-il1-f174.google.com (mail-il1-f174.google.com [209.85.166.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 922CD4C66
	for <regressions@lists.linux.dev>; Tue, 21 May 2024 16:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716308543; cv=none; b=KwIz9R90xQvnQgvWpxHQfnzA74D1tnSlxka6Th9zuEOtRfcYfkCyOyK/BIDv+XDSyvwoE0VkxrgPWwxe4UOjEFgUBX3ZTU3PTwfk5P4qoZhLeV5aCZZHuuKoqZip3rGWUKPckaYx0IM4d1JKGv4+icihZRFSMbhYbnsBWuPBabk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716308543; c=relaxed/simple;
	bh=DHud8az1epbudvpz/IpiVm1Y+K8PiNZSPN7pMLHdqnY=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=IcYZo7VDj4xm5tE3fzftXmNccEoTgJg36jOl23LuwwqYqo7b9rYMRlDYtJw/1/bNodMpn51J2gnTnmlkcmGw/u3XfI3LX3y2FquJ601A1T17EEU8RBKOdbu8WlWgHzpynwhlXazNwY88womAPBL4wxAKemBCwVr0oFbuUp3wvo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=MjgQ5ih0; arc=none smtp.client-ip=209.85.166.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="MjgQ5ih0"
Received: by mail-il1-f174.google.com with SMTP id e9e14a558f8ab-36dbdb1caf3so1291445ab.2
        for <regressions@lists.linux.dev>; Tue, 21 May 2024 09:22:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1716308541; x=1716913341; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZCGK78hZJKrOpf50PdGUurGLVSJhISvQM6TW9kyuGrg=;
        b=MjgQ5ih0yGix/YIU6Yh+v99B0ob9Uu6WXWv0aUzl09P0WfSrs3PQ/4BeZsHI8FCAtB
         K6SdlXfK4aid0WhUxz//I+ridWpJMO8XN3JTaupmZYe+gDjC5u1EFjc8ZqqKabHXrgSE
         hp3yJbazDMKvjInlSSdcR18S9+lEapFCWjOOGU21AxRzj3VQcSBjvhCXYb+ydKsPJjND
         T0jyNzPRxviHLGBwpjrFtK7rVVKV4Yv2NztWe0PNMnFEiW2Q1TGtFuo1p+IA3w0fvm/t
         6o57BLfVmcLm+qxSpdWVF+uzmnwGICBci7cXozu10C8FqRNbfIwHs/x2BqfaxN1CR8cG
         YvOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716308541; x=1716913341;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZCGK78hZJKrOpf50PdGUurGLVSJhISvQM6TW9kyuGrg=;
        b=W2kt6MHOP3G3JJ8jtLe8cZog6t0l5mReyFSS91QSn5KAvXN8atL9s6BmKWj9KkNlv6
         S7J4dT9wFoBWgh8wq5aruS6LBJecuRjD8F8ca7yTWm099hdzIBkbtA8JNAmgzFCXSE89
         i7kX3v6J6EHvl9m4MwKi0BvXLQrsQYUcVoN8m7UyQdvl2tUe7eBczYpq1k30iD1m8x+z
         NFUsNFL+4R4QS8S2Zs9dHLvfyMN9UAiFf8rMCgP3vmogORy0KvovPPrDDjjAQeAu+jP5
         QTHgy9ngh60MJShozjoCm9a5VNfAV4TGzCZgPRT3OsKoCUotjugy53Ek6PIsEferuLQO
         yE5w==
X-Forwarded-Encrypted: i=1; AJvYcCV8aO62KpaZdce8ZpOYXNsGPxKQ1Yz769UjuI2WkgPXC3poycEFBNXZRXBs8v0ODrOTlDKf8luSetbaZhjXOFPab4IpB2/80zHeAYA=
X-Gm-Message-State: AOJu0YyQ5j2ZWs97DlfU/p7YpAM+qYCyb2suk2L6Zv0/d7ZbVtkRdxkK
	aGqAVf6Ie7z64ruc0IcNtuSyIypX44w3nnsUwzLXXuhRER/IMgDLlCp/3OoakFWCdiduz76Higc
	p
X-Google-Smtp-Source: AGHT+IF6rDcptWTIfwJXxZWtRWKvJkGKnOFcU8ZqBb8gePkCL6jzK9HKZ2ttbWlwp+K7TIMG5rp49w==
X-Received: by 2002:a92:d40a:0:b0:36c:c4eb:fef7 with SMTP id e9e14a558f8ab-36cc4ebff44mr294020845ab.2.1716308533665;
        Tue, 21 May 2024 09:22:13 -0700 (PDT)
Received: from [192.168.1.116] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-36cb9e142c6sm65054805ab.72.2024.05.21.09.22.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 May 2024 09:22:12 -0700 (PDT)
Message-ID: <8de221f7-fe5a-4da9-899e-de2a856a4ddc@kernel.dk>
Date: Tue, 21 May 2024 10:22:11 -0600
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] ETXTBSY when running Yarn (Node) since af5d68f
From: Jens Axboe <axboe@kernel.dk>
To: Andrew Udvare <audvare@gmail.com>, regressions@lists.linux.dev
Cc: io-uring <io-uring@vger.kernel.org>
References: <313824bc-799d-414f-96b7-e6de57c7e21d@gmail.com>
 <8979ae0b-c443-4b45-8210-6394471dddd1@kernel.dk>
Content-Language: en-US
In-Reply-To: <8979ae0b-c443-4b45-8210-6394471dddd1@kernel.dk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/21/24 10:16 AM, Jens Axboe wrote:
> (removing stable as this isn't a stable regression, and the commit
> itself isn't marked for stable to begin with).
> 
> On 5/21/24 10:02 AM, Andrew Udvare wrote:
>> #regzbot introduced: v6.8..v6.9-rc1
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=af5d68f8892f8ee8f137648b79ceb2abc153a19b
>>
>> Since the above commit present in 6.9+, Node running a Yarn installation that executes a subprocess always shows the following:
>>
>> /test # yarn --offline install
>> yarn install v1.22.22
>> warning package.json: "test" is also the name of a node core module
>> warning test@1.0.0: "test" is also the name of a node core module
>> [1/4] Resolving packages...
>> [2/4] Fetching packages...
>> [3/4] Linking dependencies...
>> [4/4] Building fresh packages...
>> error /test/node_modules/snyk: Command failed.
>> Exit code: 126
>> Command: node wrapper_dist/bootstrap.js exec
>> Arguments:
>> Directory: /test/node_modules/snyk
>> Output:
>> /bin/sh: node: Text file busy
>>
>> The commit was found by bisection with a simple initramfs that just runs 'yarn --offline install' with a test project and cached Yarn packages.
>>
>> To reproduce:
>>
>> npm install -g yarn
>> mkdir test
>> cd test
>> cat > package.json <<EOF
>> {
>>    "name": "test",
>>    "version": "1.0.0",
>>    "main": "index.js",
>>    "license": "MIT",
>>    "dependencies": {
>>      "snyk": "^1.1291.0"
>>    }
>> }
>> EOF
>> yarn install
>>
>> Modern Yarn will give the same result but with slightly different output.
>>
>> This also appears to affect node-gyp: https://github.com/nodejs/node/issues/53051
>>
>> See also: https://bugs.gentoo.org/931942
> 
> This looks like a timing alteration due to task_work being done
> differently, from a quick look and guess. For some reason SQPOLL is
> being used. I tried running it here, but it doesn't reproduce for me.
> Tried both current -git and 6.9 as released. I'll try on x86 as well to
> see if I can hit it.

Reproduces on an x86-64 vm:

[root@archlinux test]# yarn install 
yarn install v1.22.22
warning package.json: "test" is also the name of a node core module
info No lockfile found.
warning test@1.0.0: "test" is also the name of a node core module
[1/4] Resolving packages...
[2/4] Fetching packages...
[3/4] Linking dependencies...
[4/4] Building fresh packages...
error /root/test/node_modules/snyk: Command failed.
Exit code: 126
Command: node wrapper_dist/bootstrap.js exec
Arguments: 
Directory: /root/test/node_modules/snyk
Output:
/bin/sh: /tmp/yarn--1716308447842-0.8496252120161716/node: /bin/sh: bad interpreter: Text file busy

I'll poke a bit.

-- 
Jens Axboe

