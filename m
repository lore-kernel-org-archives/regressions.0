Received: from mail-io1-f41.google.com (mail-io1-f41.google.com [209.85.166.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00D8D12C52E
	for <regressions@lists.linux.dev>; Tue, 16 Apr 2024 14:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713277992; cv=none; b=XkfI8MwaIYcffACtm11atGV+Nfd+VXYLqBoE82aw3VjQ+fKYI+JsoYYinJUwVWuhk/9nOycQc5sxvgo7Oyw0mzTkwFAHCXPIoUsQPKKwN9SlHCbDGDeHM/T/8Ju31T23cVPQBR1IDb3C8XJyVTfBxUg4HI0Sv/1+9Py3eG3yeXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713277992; c=relaxed/simple;
	bh=tQt0h4/JJzNUSt7YJAw13nbwhiLd1bvHD0j7b+rfdIA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZkOwoOQagwnUu+89DwmCr6Pq+ObdAZOUv1pJQ2ZbcXgFmq+wFhGUOlNE9qYINHLBDQbW4xWPRw61YXdZi7hIKTCNRr3UhRQ+FcN3IGm6gEfJfch8yyA5WKCkvrNjDZP7HlsKef6NIE3JoipLbqwNef6H3QgLo7he+4vfH2EifDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=nXybR/Pm; arc=none smtp.client-ip=209.85.166.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="nXybR/Pm"
Received: by mail-io1-f41.google.com with SMTP id ca18e2360f4ac-7d6112ba6baso70023339f.1
        for <regressions@lists.linux.dev>; Tue, 16 Apr 2024 07:33:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1713277990; x=1713882790; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4USUkCePqO/DUZZKKDjSqTMfiwj3FB1TFFvhdvW85WE=;
        b=nXybR/PmaaaYGmpE0/U3zPPelvy3jko+kA9kV4D2KP56DveYDzGa2UIbin3roL+3ps
         QHYsqKSxPxv0Yp1xYCj42+wO1R0FCXHVWuKsukS58dJI0QVAu3fCfuYFbOtN+6On6IkN
         cFMnrZ67JYgaENb2n5muYaUUVmEdja0k9wuav5gV9/bRDcNmJOk/ZBA039qh8G5sJJJM
         A7K3DJwSEpV+iM9jcqixivZbKkk++jZZNQlp2l0M2RLcrllavP6flFU1Tye3dB7Q7wxp
         X47koiiz+2DgZd0C8dpwpPnZUx4y/QCfrMsl+HFTtqOc5C1wmsrt6OS08n6mcizx6Gvb
         ypnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713277990; x=1713882790;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4USUkCePqO/DUZZKKDjSqTMfiwj3FB1TFFvhdvW85WE=;
        b=TxlwS+HvkJFM1L9T8b65AbRIJvOwmXoep2/zj94FVXhouVupBW/zx9cV+PzoELCVDn
         Lqn8RHRtvplYlxaevlpiRp231ZivE3NDnF4BVr+BXMa+nGoAlXDyLhaQJ6N/S6NXu6rU
         x98rUTrINw/npCwRMlQOQaR9H53df0JtFgUOvW4fh+cCohaXQQSi5m4i7zOiWPqvBN0b
         dmGKd/aZNleGW3EYSBhPX8OHRopzFjlz9gzSVlCLh5WHyoAGL4lIewx4RopVwS+ApzN/
         umWtW1V2Pwohcjn0hVrNOrhb5DDKRCi/3I7R1DvLC9lIxtNxvLZWJfeLYUtvaIHhBcdL
         YUAA==
X-Forwarded-Encrypted: i=1; AJvYcCVSQyElGIn+J5/aPoUSMIWHnDxy2DQNXAFoC5agzF5GUdTmUuva785kPgPVTXzKG7h05v3fqInBn85qGg1pUwLKk5nFcfifdC3W7BI=
X-Gm-Message-State: AOJu0YxwkI6DVbgrBsvl9u+coHJmFE3B6Kdhm+6J+VWr4qCbsLu4sTJ/
	7pvdokyFI65NSO/pE1mD/aLjKl6LGRSPkQM5myYRbxVKt2xa5vjNTPk/Ancse3RlGgHjX/pRKCl
	p
X-Google-Smtp-Source: AGHT+IEFdSzzJPNEuBYNeCsLyyZ+pPblusmvyciDSgRZZSqKohbfOFFV+4drEx+cUWKBoEDWOFDJFg==
X-Received: by 2002:a05:6602:38d:b0:7d6:513b:254 with SMTP id f13-20020a056602038d00b007d6513b0254mr13722190iov.2.1713277990087;
        Tue, 16 Apr 2024 07:33:10 -0700 (PDT)
Received: from [192.168.1.116] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id v7-20020a056638250700b0047f1ac1bfd2sm3909914jat.163.2024.04.16.07.33.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Apr 2024 07:33:09 -0700 (PDT)
Message-ID: <c3a6a639-bf15-4f8b-abbd-978d9836d93c@kernel.dk>
Date: Tue, 16 Apr 2024 08:33:07 -0600
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: API break, sysfs "capability" file
Content-Language: en-US
To: Lennart Poettering <mzxreary@0pointer.de>
Cc: Christoph Hellwig <hch@lst.de>, Keith Busch <kbusch@kernel.org>,
 Linux regressions mailing list <regressions@lists.linux.dev>,
 linux-block@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
References: <ZhQJf8mzq_wipkBH@gardel-login>
 <54e3c969-3ee8-40d8-91d9-9b9402001d27@leemhuis.info>
 <ZhQ6ZBmThBBy_eEX@kbusch-mbp.dhcp.thefacebook.com>
 <ZhRSVSmNmb_IjCCH@gardel-login>
 <ZhRyhDCT5cZCMqYj@kbusch-mbp.dhcp.thefacebook.com>
 <ZhT5_fZ9SrM0053p@gardel-login> <20240409141531.GB21514@lst.de>
 <d7a2b07c-26eb-4d55-8aa7-137168bd0b49@kernel.dk>
 <Zh6IpqnSfGHXMjVa@gardel-login>
 <b74f99e8-5a50-4e93-987f-0bcfc0c27959@kernel.dk>
 <Zh6KZ7ynHuOd0mgQ@gardel-login>
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <Zh6KZ7ynHuOd0mgQ@gardel-login>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/16/24 8:25 AM, Lennart Poettering wrote:
> On Di, 16.04.24 08:22, Jens Axboe (axboe@kernel.dk) wrote:
> 
>> On 4/16/24 8:18 AM, Lennart Poettering wrote:
>>> On Di, 09.04.24 09:17, Jens Axboe (axboe@kernel.dk) wrote:
>>>
>>>> On 4/9/24 8:15 AM, Christoph Hellwig wrote:
>>>>> On Tue, Apr 09, 2024 at 10:19:09AM +0200, Lennart Poettering wrote:
>>>>>> All I am looking for is a very simple test that returns me a boolean:
>>>>>> is there kernel-level partition scanning enabled on this device or
>>>>>> not.
>>>>>
>>>>> And we can add a trivial sysfs attribute for that.
>>>>
>>>> And I think we should. I don't know what was being smoked adding a sysfs
>>>> interface that exposed internal flag values - and honestly what was
>>>> being smoked to rely on that, but I think it's fair to say that the
>>>> majority of the fuckup here is on the kernel side.
>>>
>>> Yeah, it's a shitty interface, the kernel is rich in that. But it was
>>> excessively well documented, better in fact than almost all other
>>> kernel interfaces:
>>>
>>> ? https://www.kernel.org/doc/html/v5.16/block/capability.html ?
>>>
>>> If you document something on so much detail in the API docs, how do
>>> you expect this *not* to be relied on by userspace.
>>
>> This is _internal_ documentation, not user ABI documentation. The fact
>> that it's talking about internal flag values should make that clear,
>> though I can definitely see how that's just badly exposed along with
>> other things that document things that users/admins could care about.
> 
> The text begins with:
> 
>     "This file documents the sysfs file block/<disk>/capability."
> 
> So it makes very clear this is about the sysfs interface.
> 
> Are you saying that sysfs of the block layer should be considered an
> *internal* kernel API? That's a wild definition, if I may say so.

No I missed that - to me it's clearly internal documentation as it's
talking about the flags, but yeah you are right it's being presented as
sysfs documentation for the 'capability' file. That should never have
gone into the tree as ABI documentation.

Doesn't really change my conclusion from earlier. As mentioned, this is
clearly a kernel fuckup, and honestly since it's being presented as ABI,
we definitely need to rectify this and provide an alternative. Even
though I'm not a huge fan of it, might just be best to re-introduce
'capability' and just have conversions of the flags so we retain the
user side of it the same. That can then also go into stable, so we'll
end up with something that at least looks cohesive on the user side.

-- 
Jens Axboe

