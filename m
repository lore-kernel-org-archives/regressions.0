Received: from rs225.mailgun.us (rs225.mailgun.us [209.61.151.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9605815BE
	for <regressions@lists.linux.dev>; Wed, 21 Jun 2023 02:46:42 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=hexchain.org;
 q=dns/txt; s=smtp; t=1687315601; x=1687322801; h=Content-Transfer-Encoding:
 Content-Type: In-Reply-To: From: From: References: Cc: To: To: Subject:
 Subject: MIME-Version: Date: Message-ID: Sender: Sender;
 bh=5stQnICSelnzp1yyIPPD1WlmY4XcWQOBfdxQvv1XFbw=;
 b=FFaVNFSZw4a9h0FWJ422Z1MD4yS/Z0mPKWy5NO4DU3aNWsf4YVdBUEHXlHnGBL7JSRt55QhnbJxzZzypMRIH/ScLh03E4Tj9kf1FfHFN0wi2Ygnjj0sWRZi8Pfg+v07xGpjktW2Gwy+L97o5Y5nowDEe0oir/1tod1aErwakCNu6UIfuz+0ZfQgZQBDThpeAmJ/rjgq3qYxewOs8yU9l7P3L23xLbslyo6p5lqxU+zq1LDc5i25W4QbeMGchlh2m4nxcG5gYQuiiXNDgfs3d0zAQbzoS6Ze68w53n9Nvg9MMcM9N0BYijpBfaiIm+Tj5mg+fdN7J1UD/lEQthb9U/w==
X-Mailgun-Sending-Ip: 209.61.151.225
X-Mailgun-Sid: WyIwZGQ5YyIsInJlZ3Jlc3Npb25zQGxpc3RzLmxpbnV4LmRldiIsIjE5MjUxOCJd
Received: from [10.22.69.180] (122.11.166-8.unknown.starhub.net.sg [122.11.166.8]) by
 0b3e52753156 with SMTP id 6492649145220fab9318d1b5; Wed, 21 Jun 2023 02:46:41
 GMT
Sender: linux@hexchain.org
Message-ID: <653274b4-7b69-8f3f-4214-e0be36f7102e@hexchain.org>
Date: Wed, 21 Jun 2023 10:46:37 +0800
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: amd_sfh driver causes kernel oops during boot
To: Linux regressions mailing list <regressions@lists.linux.dev>,
 Malte Starostik <malte@starostik.de>,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 "Limonciello, Mario" <mario.limonciello@amd.com>
Cc: Bagas Sanjaya <bagasdotme@gmail.com>, basavaraj.natikar@amd.com,
 linux-input@vger.kernel.org, linux@hexchain.org, stable@vger.kernel.org
References: <ZG3ipauL9FTnQJiC@debian.me>
 <aci7a4jnosozypn6sffsdoaezg4p42zgjy5dwnjyvnbav7chdm@wettfjwb4enw>
 <79bd270e-4a0d-b4be-992b-73c65d085624@amd.com> <5980752.YW5z2jdOID@zen>
 <1b3fd148-44d7-d476-e9e6-f9d8c8ec0ee6@leemhuis.info>
Content-Language: en-US
From: Haochen Tong <linux@hexchain.org>
In-Reply-To: <1b3fd148-44d7-d476-e9e6-f9d8c8ec0ee6@leemhuis.info>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/20/23 21:20, Linux regression tracking (Thorsten Leemhuis) wrote:
> Hi, Thorsten here, the Linux kernel's regression tracker. Top-posting
> for once, to make this easily accessible to everyone.
> 
> What happens to this? From here it looks like there was no progress to
> resolve the regression in the past two weeks, but maybe I just missed
> something.

Hi,

I just looked at the journal again and this problem seemed to go away 
after upgrading from 6.3.3 to 6.3.5. At that time the BIOS version was 
still 1.27. Now, on 1.57, the device 1022:164a is indeed no longer 
present anymore.
