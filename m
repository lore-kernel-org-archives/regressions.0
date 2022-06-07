Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 768C57F
	for <regressions@lists.linux.dev>; Tue,  7 Jun 2022 12:02:29 +0000 (UTC)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1nyXui-0001x2-Co; Tue, 07 Jun 2022 14:02:24 +0200
Message-ID: <6a90904d-f569-7ebc-9e34-893a0808694c@leemhuis.info>
Date: Tue, 7 Jun 2022 14:02:21 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: boot loop since 5.17.6
Content-Language: en-US
To: Thomas Sattler <sattler@med.uni-frankfurt.de>
Cc: stable@vger.kernel.org, regressions@lists.linux.dev
References: <11495172-41dd-5c44-3ef6-8d3ff3ebd1b2@med.uni-frankfurt.de>
 <c3b370a8-193e-329b-c73a-1371bd62edf3@med.uni-frankfurt.de>
 <181a6369-e373-b020-2059-33fb5161d8d3@med.uni-frankfurt.de>
 <YpksflOG2Y1Xng89@dev-arch.thelio-3990X>
 <1f8a4bec-53bd-aaaa-49a7-b5ed4fc5ae34@med.uni-frankfurt.de>
 <a9a68c68-8830-2aa0-acbe-d5d3bb04968f@leemhuis.info>
 <4dc96ed3-169e-37b9-7b8f-85e58dca0bbf@med.uni-frankfurt.de>
From: Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <4dc96ed3-169e-37b9-7b8f-85e58dca0bbf@med.uni-frankfurt.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1654603349;fd4dd2ad;
X-HE-SMSGID: 1nyXui-0001x2-Co

On 07.06.22 13:40, Thomas Sattler wrote:
>
> I just compiled 5.19-rc1 and my issue is solved there.

Then in the interest of the greater good it would be good if you could
check 5.18.y as well, as if it doesn't work it might be a good idea to
identify what fixed the problem in mainline and backport the fix to
5.18.y. The same is kinda true for 5.17 as well, but obviously it's your
choice if you want to spend time on this.

Ciao, Thorsten
