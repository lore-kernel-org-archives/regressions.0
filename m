Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D53C6FA7
	for <regressions@lists.linux.dev>; Sat,  6 Jan 2024 11:34:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SVXDlK/5"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5576ca4119cso132336a12.2
        for <regressions@lists.linux.dev>; Sat, 06 Jan 2024 03:34:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704540842; x=1705145642; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9Yf7LENhQSqenSscECwkvVs+MDQCFfBLSHrYitmyEzQ=;
        b=SVXDlK/5vB2AwvDucKHQqQjr5KZleSDbd/vcH1auvupxGA/nDCJhs3xrTwjB/o6A9K
         EpEuvGWHFy4UiulyFJsYVi1yApXtoIKdu9HcfCIEB17SQ+BAPdnpc/ljxc3P5iqbZKyq
         O6PLBqAjVRldAOY6Pzs/K5Mb09OeSj9KkSXFYc2AzvpXaivxdwjwbyHRmXOPCGSqkr7s
         kTcJ4VZLenqDhikokNXA3JhjPqabgYqCYKcJwp9mYykCiJbqrJ3JzcEXDTuSmytHeKg4
         uK62jdy3nzLi//dnjZn/TkZrlx91jTVxtB6qH0L/AXgzDLysuxOuMDQEX8s9oR0sSCQO
         2jWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704540842; x=1705145642;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9Yf7LENhQSqenSscECwkvVs+MDQCFfBLSHrYitmyEzQ=;
        b=GTcRC981GVM3Ilw5xTi6TjF/8F9KMUDqFBeHj+GzS9+bloqDv9UVhqTrP/HxA02gIB
         if2iazGyygj0JAZ4bFL8Y/cQVrFIIDT6b7PpsrKyf1j5strci8c6iyDoOZsx4/lig3u3
         ON+NWvlBr7hUv9Dqqu7VrzHj0LeO2W+sKww5IgOS9RnnSUod2STBC3saY83aY8mDFXU6
         IWJpBo2sGM2jZU/gOWbKDGkCvDOc4+T2WGWGdE4WUacEA2XMx2RDNU+1Vy68WnF3eVxf
         m6t7axN4VaeVWsiTZXr45l8i7bJ6R4YrBXqUHd7z604hyIaiGvIlVRRkiwP2gQTCiAd6
         7apA==
X-Gm-Message-State: AOJu0YyijApdsGm/U4iNwywxzZHyz8gudPCnWKP8VyXOcYx9SjjcBNer
	xrbJMHpVwsa/VH3wR0LmX0E=
X-Google-Smtp-Source: AGHT+IG5Ec+Xjl/1zLe/Q4M2ZuntsvOhm9Pk2mEirugLidEvZOczFSbhZzcamtbqPwPx7hl+5Fn0vg==
X-Received: by 2002:a50:d602:0:b0:553:40bc:4eca with SMTP id x2-20020a50d602000000b0055340bc4ecamr408934edi.37.1704540842439;
        Sat, 06 Jan 2024 03:34:02 -0800 (PST)
Received: from eldamar.lan (c-82-192-242-114.customer.ggaweb.ch. [82.192.242.114])
        by smtp.gmail.com with ESMTPSA id ef9-20020a05640228c900b0055751515a84sm749563edb.51.2024.01.06.03.34.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jan 2024 03:34:01 -0800 (PST)
Sender: Salvatore Bonaccorso <salvatore.bonaccorso@gmail.com>
Received: by eldamar.lan (Postfix, from userid 1000)
	id 06CDABE2DE0; Sat,  6 Jan 2024 12:34:01 +0100 (CET)
Date: Sat, 6 Jan 2024 12:34:00 +0100
From: Salvatore Bonaccorso <carnil@debian.org>
To: Linux regressions mailing list <regressions@lists.linux.dev>,
	"Jitindar Singh, Suraj" <surajjs@amazon.com>
Cc: "rohiths.msft@gmail.com" <rohiths.msft@gmail.com>,
	"gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>,
	"stfrench@microsoft.com" <stfrench@microsoft.com>,
	"dhowells@redhat.com" <dhowells@redhat.com>,
	"pc@manguebit.com" <pc@manguebit.com>,
	"jlayton@kernel.org" <jlayton@kernel.org>,
	"nspmangalore@gmail.com" <nspmangalore@gmail.com>,
	"willy@infradead.org" <willy@infradead.org>,
	"stable-commits@vger.kernel.org" <stable-commits@vger.kernel.org>,
	stable@vger.kernel.org, linux-cifs@vger.kernel.org
Subject: Re: [Regression 6.1.y] From "cifs: Fix flushing, invalidation and
 file size with copy_file_range()"
Message-ID: <ZZk6qA54A-KfzmSz@eldamar.lan>
References: <2023121124-trifle-uncharted-2622@gregkh>
 <a76b370f93cb928c049b94e1fde0d2da506dfcb2.camel@amazon.com>
 <ZZhrpNJ3zxMR8wcU@eldamar.lan>
 <8e59220d-b0f3-4dae-afc3-36acfa6873e4@leemhuis.info>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8e59220d-b0f3-4dae-afc3-36acfa6873e4@leemhuis.info>

Hi,

On Sat, Jan 06, 2024 at 11:40:58AM +0100, Linux regression tracking (Thorsten Leemhuis) wrote:
> Hi, Thorsten here, the Linux kernel's regression tracker. Top-posting
> for once, to make this easily accessible to everyone.
> 
> Thank's for CCIng the regression list and telling regzbot about the
> issue. There is one important thing that afaics[1] is missing and would
> be really good to know[2]:
> 
> Does this problem also happen in mainline, e.g. with 6.7-rc8?
> 
> Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
>
> [1] I hope I didn't miss this
> [2] as explained here:
> https://docs.kernel.org/admin-guide/reporting-issues.html
> https://linux-regtracking.leemhuis.info/post/frequent-reasons-why-linux-kernel-bug-reports-are-ignored/#you-reported-a-regression-in-a-stable-or-longterm-series-without-checking-if-mainline-is-affected-as-well

Thanks a lot for replying back. So far I can tell, the regression is
in 6.1.y only and might indicate that some prerequisite changes (maybe
in the folio refactoring?) is missing. The commit identified by Suraj,
7b2404a886f8 ("cifs: Fix flushing, invalidation and file size with
copy_file_range()") from 6.7-rc5 was backported to two of the stable
series, 6.1.68 and 6.6.7.

I did not test mainline specifically (would need to first build) but
did test 6.6.9 based version and the problem is not reproduible there
(and neither with 6.6.10-rc1 which I have build for the RC series
review posting).

For this reason I added to regzbot only "regzbot ^introduced
18b02e4343e8f5be6a2f44c7ad9899b385a92730" which is the commit in
v6.1.68.

Regards,
Salvatore
