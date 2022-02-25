Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8875D1FBD
	for <regressions@lists.linux.dev>; Fri, 25 Feb 2022 11:56:28 +0000 (UTC)
Received: from ip4d144895.dynamic.kabel-deutschland.de ([77.20.72.149] helo=[192.168.66.200]); authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1nNZCy-0002tQ-Pf; Fri, 25 Feb 2022 12:56:24 +0100
Message-ID: <32ae6671-510c-9a9f-3e01-93a8f45ede7a@leemhuis.info>
Date: Fri, 25 Feb 2022 12:56:23 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v5 0/3] docs: add two texts covering regressions
Content-Language: en-BS
To: Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: workflows@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Randy Dunlap <rdunlap@infradead.org>, regressions@lists.linux.dev,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>
References: <cover.1644994117.git.linux@leemhuis.info>
 <871qzskpf8.fsf@meer.lwn.net>
From: Thorsten Leemhuis <linux@leemhuis.info>
In-Reply-To: <871qzskpf8.fsf@meer.lwn.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;linux@leemhuis.info;1645790188;98cac13c;
X-HE-SMSGID: 1nNZCy-0002tQ-Pf

On 24.02.22 20:58, Jonathan Corbet wrote:
> Thorsten Leemhuis <linux@leemhuis.info> writes:
> 
>> "We don't cause regressions" might be the first rule of Linux kernel
>> development, but it and other aspects of regressions nevertheless are hardly
>> described in the Linux kernel's documentation. The following patches change
>> this by creating two documents dedicated to the topic.
>>
>> The second patch could easily be folded into the first one, but was kept
>> separate, as it might be a bit controversial. This also allows the patch
>> description to explain some backgrounds for this part of the document.
>> Additionally, ACKs and Reviewed-by tags can be collected separately this way.
> 
> Hearing no objections, I have applied this set, thanks.

Great, thx!

Ciao, Thorsten
