Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5333A19A
	for <regressions@lists.linux.dev>; Sat,  4 Nov 2023 00:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jETZns5v"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-6c34e87b571so1571298b3a.3
        for <regressions@lists.linux.dev>; Fri, 03 Nov 2023 17:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699057643; x=1699662443; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZSruXExCC7oyLfN8ZSYHDj8sJJzKMrm8E7odv0JQbpk=;
        b=jETZns5v5S6dwn+ioxGo1tqrTWiUj/t1u3iAHtmjLCPz4qyccT63yFoVTUEwqyjbuZ
         n83XZPBqmWij66ZT1TQgZJ88CSpkjZDhtXVPYvDdknTlK+mnPHIqjsy2keH4ZAl/2XXT
         C+no33GTpOSE+ZX6SghTmCNjQ92twN1KBa4FTwB8FEHZjcoh4by9miyt4hOUW88NYvvF
         p7R3zhjjJIczYrv/fHnBD4Du2LeGcLgpT1GuZ6SUpO2oJ2HNgWQBMQrOtOiEfdMnRrIj
         VjDpMrL8IMwNDHc+qqmtGU0h6+Jv4PPPjLtoMGBvOSIDK0audSqdStWpmtiNNCz2C6RP
         pIiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699057643; x=1699662443;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZSruXExCC7oyLfN8ZSYHDj8sJJzKMrm8E7odv0JQbpk=;
        b=CPl1AtAy586O4WL+0bXZelcvQjC+t2MOTbRMtbP06hPCgWBPTAsR3cxa3RoPifmvaq
         GeEWgt9LEacEVtgTJMDgSH25jc3wLV1uX228+4U0lyiQpJf6QPGQ8X8KOli0ywRVucMh
         SsVzbY5meaHXD39A4E9M4F3b8TncrDu9H/m1mxcLDdQGSTBDLKIFKM5vH8/bfc0YHHSK
         hVEjC5XrgKBIHWqcBHpPdZeSg9g8EPQCWmYs/LccXr91/15tdGUzoQYuyWzvtuENX4oK
         5k8DXh2CzIb+4UEnJgtEsMYtkbkYDTJ7JqHUtVyGKzoupvBL/Yw+WFZkUqgTcy+yLhT8
         +gzA==
X-Gm-Message-State: AOJu0YwUOcdXHjeGFxDvo2UiEDJMpa2pgStKLIYjALuEFhcU/UAs2XAL
	9b2ddEhq1qy5PSWP27xk9c0=
X-Google-Smtp-Source: AGHT+IFfm/C4eEi089pE7HOXJTu6LK5uaY2KHPfzzcBQCM008GsYRPPDZ9ry9IpfM7Ka0d7L3TLDfw==
X-Received: by 2002:a05:6a00:10d2:b0:693:3963:847a with SMTP id d18-20020a056a0010d200b006933963847amr22580602pfu.30.1699057643443;
        Fri, 03 Nov 2023 17:27:23 -0700 (PDT)
Received: from [192.168.0.106] ([103.131.18.64])
        by smtp.gmail.com with ESMTPSA id it10-20020a056a00458a00b0068ffd4eb66dsm1952259pfb.35.2023.11.03.17.27.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Nov 2023 17:27:22 -0700 (PDT)
Message-ID: <e93d5996-e9fc-4c28-ad33-5fd62fbac92d@gmail.com>
Date: Sat, 4 Nov 2023 07:27:15 +0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: autofs mount/umount hangs with recent kernel?
To: Charles Hedrick <hedrick@rutgers.edu>, Daire Byrne <daire@dneg.com>,
 Linux NFS <linux-nfs@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Regressions <regressions@lists.linux.dev>
Cc: Chuck Lever <chuck.lever@oracle.com>, Jeff Layton <jlayton@kernel.org>,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 Anna Schumaker <anna@kernel.org>
References: <CAPt2mGNPSi-+3WdeMsOjkJ2vOqZcRE2S6i=eqi+UA2RmzywAyg@mail.gmail.com>
 <ZUT_W8yoJ5wqSvLv@debian.me>
 <PH0PR14MB5493BD73D14C0002DE32DAE3AAA5A@PH0PR14MB5493.namprd14.prod.outlook.com>
Content-Language: en-US
From: Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <PH0PR14MB5493BD73D14C0002DE32DAE3AAA5A@PH0PR14MB5493.namprd14.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04/11/2023 03:07, Charles Hedrick wrote:
> We've seen behavior like that throughout the lifetime of 4.10 and 5.15 as well. It may be a different issue, though. For us it happens only with NFS 4.2. NFS 3 is fine. And once it happens, rebooting the client doesn't help. We have to reboot the NFS server. We're trying setting automount to never unmount, as an attempt to figure out whether the problem is actually caused by the unmounts and mounts.
> 
> I'd be happy to help diagnose if someone could tell me what data would be useful.
> 

Please don't top-post; reply inline with appropriate context instead.
And don't send HTML emails either, since mailing lists reject them.

First, you may want to test the mainline (currently at v6.6) on both
the server and the client. Then, please attach full system log
(most likely journalctl) to see if you have the same one as Daire
reported.

Thanks.

-- 
An old man doll... just what I always wanted! - Clara

