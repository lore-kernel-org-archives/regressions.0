Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60405622
	for <regressions@lists.linux.dev>; Tue, 31 Jan 2023 01:46:31 +0000 (UTC)
Received: by mail-vs1-f45.google.com with SMTP id i185so14593258vsc.6
        for <regressions@lists.linux.dev>; Mon, 30 Jan 2023 17:46:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=draconx-ca.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=r0G78tCFuMbUc11f4Np3FVLjYUjXRj+1bSf/D+z772Y=;
        b=mBtK5jkiEPcmqnnUf3pWbeh8X1hzLi8VxrmvPgnBVeR64+mnnmMndwS6dpqTQOgQTV
         GYrR7P3jZQo0pYnE8xyMUtVNrxhSv+1+3CdCnGJjS5kJOjSRSy0v6Su3cI6SYyqauSlB
         vPb8rMkw1MYjQiYj4oaoqHB3JVw4YvTnr2t97GRBiG2II0iD6Qq1DylRNSQrOR5rrmse
         cqXxYh6CCSb4Jd0lCVVJKNNpJGOcQa8yJTUZbSj0XSMK4LNVSLGenAQR4ZBr54k4VZIo
         RCH+zjvb6Bcc9CwtuiKAgBA08gZS+RMrsWymnMqBCPaa1E8w70bbakPcfMlclVt+O1T+
         8ZwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r0G78tCFuMbUc11f4Np3FVLjYUjXRj+1bSf/D+z772Y=;
        b=7SxMtT0ZoClXmJ1b+6gRrU0pN9eji7a57iFDznCyyo3C/ERtwAlkrpbgHE+mg+h29M
         8aj9UwFvwEEQNHak+IDckMKXl/tZXqFPUpiYa/7vUBWzh9AuJlZ7wy5KQZp2Qi4DcUXB
         aWF/guy8NPyA6Sxj0tdm1BTeLgwe+sP/SWbOo7w2jQjLnAMUWkGINymMxfYjpi5FlTom
         cID1YCEErDQkz3JjDdiKvJAt63oQYNiDQEg8lG78/62e4M+AsezlbqdjGnD0zGrt87cK
         2utEqVCbzqK4hdlRtpxkTzqwzb25b6ShmcVJ2ZF+2We2NLHbO4ZQwGvrPNwJDpqWL+78
         0vsg==
X-Gm-Message-State: AO0yUKXbt1QUZQV0SmjuWZW9I+pazmnrNJ4vlKbBa9S5XpGNoMGWmvnq
	CfE5jC8J61vG+IqBk1zTHc0zYtg2DERHO4zIfrPI3w==
X-Google-Smtp-Source: AK7set8T18QDx4rAbFvPvwBDlz5oPdhQHy9nhjNv0cUUAZfeKar7Fpa3GKrYmMJRQRPGA3x+F0b5SBaQ6GGUsLHTgr0=
X-Received: by 2002:a67:ecd8:0:b0:3eb:e432:5601 with SMTP id
 i24-20020a67ecd8000000b003ebe4325601mr2837366vsp.16.1675129590180; Mon, 30
 Jan 2023 17:46:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Received: by 2002:a05:6130:1015:b0:559:9619:d862 with HTTP; Mon, 30 Jan 2023
 17:46:29 -0800 (PST)
X-Originating-IP: [24.53.241.20]
In-Reply-To: <Y9bvwz4FIOQ+D8c4@x1n>
References: <CADyTPExpEqaJiMGoV+Z6xVgL50ZoMJg49B10LcZ=8eg19u34BA@mail.gmail.com>
 <Y9bvwz4FIOQ+D8c4@x1n>
From: Nick Bowler <nbowler@draconx.ca>
Date: Mon, 30 Jan 2023 20:46:29 -0500
Message-ID: <CADyTPEzsvdRC15+Z5T3oryofwRYqHmHzwqRmJKJoHB3d7Tdayw@mail.gmail.com>
Subject: Re: PROBLEM: sparc64 random crashes starting w/ Linux 6.1 (regression)
To: Peter Xu <peterx@redhat.com>
Cc: linux-kernel@vger.kernel.org, sparclinux@vger.kernel.org, 
	regressions@lists.linux.dev, Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"

On 2023-01-29, Peter Xu <peterx@redhat.com> wrote:
> On Sat, Jan 28, 2023 at 09:17:31PM -0500, Nick Bowler wrote:
>> Starting with Linux 6.1.y, my sparc64 (Sun Ultra 60) system is very
>> unstable, with userspace processes randomly crashing with all kinds of
>> different weird errors.  The same problem occurs on 6.2-rc5.  Linux
>> 6.0.y is OK.
[...]
> Could you try below patch to see whether it fixes your problem?  It should
> cover the last piece of possible issue with dirty bit on sparc after that
> patchset.  It's based on latest master branch (commit ab072681eabe1ce0).

Haven't seen any failures yet, so it seems this patch on top of 6.2-rc6
makes things much better.

I'll keep running this for a while to see if any other problems come up.

Thanks,
  Nick
