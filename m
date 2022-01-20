Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE6AA2C80
	for <regressions@lists.linux.dev>; Thu, 20 Jan 2022 14:56:40 +0000 (UTC)
Received: from ip4d173d02.dynamic.kabel-deutschland.de ([77.23.61.2] helo=[192.168.66.200]); authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1nAYre-0002ZP-Uh; Thu, 20 Jan 2022 15:56:39 +0100
Message-ID: <34eb9d46-d937-fc29-02b1-7cfb9162f9b8@leemhuis.info>
Date: Thu, 20 Jan 2022 15:56:38 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-BS
From: Thorsten Leemhuis <regressions@leemhuis.info>
To: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
Subject: Intel TGL notebook no longer enters power states deeper than PC2 (fwd
 from bugzilla)
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1642690600;004424f5;
X-HE-SMSGID: 1nAYre-0002ZP-Uh

Lo! There is a regression dealt with in bugzilla I'd like to add to the
tracking:

#regzbot introduced: e5ad96f388b765fe6b52f64f37e910c0ba4f3de7
#regzbot link: https://bugzilla.kernel.org/show_bug.cgi?id=215467
#regzbot from: MarcelHB <m.heingbecker@googlemail.com>
#regzbot title: Intel TGL notebook no longer enters power states deeper
than PC2

> Summary:
> 
> Starting with Kernel 5.15, my Intel TGL notebook no longer enters power
> states deeper than PC2. Previous kernels did so.
> 
> Explanation:
> 
> On my notebook, I recently started to observed that the battery drained
> quickly while in a presumed suspend mode. In the past, there was no such
> problem.
> 
> I was able to bisect the problem on a tag-basis, analyzing deeper
> information on what looks good and what does not.
> 
> In the short: From somewhere at least v5.11.x until v5.14.21, the
> system operates as expected when closing the lid. Starting with 5.15.0, I observed the anomalies as reported below.

Ciao, Thorsten
