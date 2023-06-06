Received: from so254-18.mailgun.net (so254-18.mailgun.net [198.61.254.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F670395
	for <regressions@lists.linux.dev>; Tue,  6 Jun 2023 03:41:43 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=hexchain.org;
 q=dns/txt; s=smtp; t=1686022903; x=1686030103; h=Content-Transfer-Encoding:
 Content-Type: In-Reply-To: From: From: References: Cc: To: To: Subject:
 Subject: MIME-Version: Date: Message-ID: Sender: Sender;
 bh=u1pvXUWtIwz2eD+X69oV/OSCEU6o+DhbuWvUQQ5s1ZI=;
 b=ajJ1iB6cy4Px4WNdllJxJfH1ZxK4k/hX0lCXCwZ4hk2ta8LHmD9sklwjdyrahOopHe9zwkGuDzXg6e0V0il53ew7IHzn+swqARaqPID9U4cZF+XqAKXox2vK3DOtCuNgCjWihxpB56DVCdfEPUS/JXla/mbA9z6uXl255o5lJzTD4fpzzLCny8l1RCZG2At2PHEvrdKeyzYSgS5uD0oSqIZeGtm+KMJ8Y/fNbM5C1gDIXlcwCNJS6p5g77ciARoDKuGt4DYVPLZ3RA8xoRptV8CKFXneRmoOQa+WL6TjBlWntLWhR5kDsO3kjkFKy66Ip4l93QzwmcWNskzFGd0n/w==
X-Mailgun-Sending-Ip: 198.61.254.18
X-Mailgun-Sid: WyIwZGQ5YyIsInJlZ3Jlc3Npb25zQGxpc3RzLmxpbnV4LmRldiIsIjE5MjUxOCJd
Received: from [10.22.69.162] (122.11.166-8.unknown.starhub.net.sg [122.11.166.8]) by
 84706ca86aed with SMTP id 647eaaf68b2ac595faf0cd6b; Tue, 06 Jun 2023 03:41:42
 GMT
Sender: linux@hexchain.org
Message-ID: <d354c90c-03cb-1919-e587-a2cfd0511add@hexchain.org>
Date: Tue, 6 Jun 2023 11:41:39 +0800
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: amd_sfh driver causes kernel oops during boot
To: Bagas Sanjaya <bagasdotme@gmail.com>, stable@vger.kernel.org,
 "Linux regression tracking (Thorsten Leemhuis)" <regressions@leemhuis.info>
Cc: regressions@lists.linux.dev, linux-input@vger.kernel.org,
 Basavaraj Natikar <basavaraj.natikar@amd.com>
References: <f40e3897-76f1-2cd0-2d83-e48d87130eab@hexchain.org>
 <ZG2LXN2+Sa2PWJqz@debian.me>
 <ee2c30a5-3927-d892-2a66-00cd513c3899@hexchain.org>
 <ZG3ipauL9FTnQJiC@debian.me> <ZH6cd6_8EUrRY0W0@debian.me>
Content-Language: en-US
From: Haochen Tong <linux@hexchain.org>
In-Reply-To: <ZH6cd6_8EUrRY0W0@debian.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/6/23 10:39, Bagas Sanjaya wrote:
> On Wed, May 24, 2023 at 05:10:45PM +0700, Bagas Sanjaya wrote:
>> On Wed, May 24, 2023 at 02:10:31PM +0800, Haochen Tong wrote:
>>>> What last kernel version before this regression occurs? Do you mean
>>>> v6.2?
>>>>
>>>
>>> I was using 6.2.12 (Arch Linux distro kernel) before seeing this regression.
>>
>> Can you perform bisection to find the culprit that introduces the
>> regression? Since you're on Arch Linux, see its wiki article [1] for
>> instructions.
>>
> 
> Haochen, any news on this? Has the bisection been done and any result?
> Another reporter had concluded possibly bad bisect [1].
> 
> Thanks.
> 
> [1]: https://lore.kernel.org/regressions/3250319.ancTxkQ2z5@zen/
> 

Hi,

Sorry for the late reply. I haven't gotten enough time for it yet.

I took a look at the git logs, and it doesn't look like the modules 
involved in the original stack trace (amd_sfh, hid_sensor_hub, 
hid_sensor_iio_common, hid_sensor_gyro_3d) has received any significant 
changes between v6.2 and v6.3. IMHO, the bisect done by Malte might 
indicate that the issue could be a problem outside of these modules.

Also, I've upgrade from 6.3.3 to 6.3.5 a week ago and this issue hasn't 
happened so far in 4 reboots. However, there still doesn't seem to be 
any changes regarding these modules, so I'm not sure if it's fixed 
elsewhere or I'm just being lucky. It would be nice if someone can 
confirm or disprove this.


Thanks,
