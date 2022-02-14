Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76E8AA35
	for <regressions@lists.linux.dev>; Mon, 14 Feb 2022 18:46:26 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id j4so11240423plj.8
        for <regressions@lists.linux.dev>; Mon, 14 Feb 2022 10:46:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=DgckHGaAkZcrGYa6I90wSGex+wSps1HIk1YzJ1huHBo=;
        b=RJZZX4DXXXc2Vva5RTK54qqa2xE6JBudRSuqI1jH8ljthTNxhlQbRoXtDtgKJ/Vtd3
         9ARstZWodppgVy/ebyhHmFuYiBxh2UAqBhQ/E2HUbJnV47uO0Je2ybKWozhvnHoZFa/n
         PJQElJg2hTvwZbmARt5NeCK94ASxd9CeE+VG/w+N1dmHyu0dDtOclUaqiUiNGpkFSUQg
         FZd/gMLsHHcB5kTYNCETi/yTUZV4pWlqn5DSfzTBdjoGNc8fIJcLvalCCW8W3xbvIE7v
         wuorMvmulrHFt/gA587y5lKfUCWoYEIdYQ5T7VeAAMwZtcUqBjcMest87frN83K7Je1T
         nMHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=DgckHGaAkZcrGYa6I90wSGex+wSps1HIk1YzJ1huHBo=;
        b=Irp9Ck+KHvxx7Mnvh0tJtz9kjHyhK4FeYD3D3YVuIQoKZl/BffJ90LxNNng4k7FeKa
         ny35G1pQHW/kVi5VQVrZOR+3jpMnjDXnYiBvNmBTusr2oWdKbrZq9hdQy6AYnChtpm8A
         7DvD46lr78BL+z4Op9/8xfln8onLM2SRg1lSGFn+ZpX2wv4M7u4L7cFnyZ1mCDAwq4VO
         hEFCnR5i1ZndmW5KdWmnXX6KL/J+0pyf0GiRrchwLuLog8w3EESRhaekrJLWOqGXeu3n
         aavRWHwZLEJYdgKRHgbkJXFc5dYbxj+WrN/gEd/Q1wPNR65yX+gg6cd3rSA32wFtRgX/
         8iBQ==
X-Gm-Message-State: AOAM532a3gg6gf9s41M0hI/uQjEzNcQA4MwvQFIOYShvi1N2S5ldaE3N
	JDcu9SIt0/oHmYlL7vBX6iI=
X-Google-Smtp-Source: ABdhPJwJMB9C8naMZb2fI5M9G0VerPo7wYHQv0HzQTYEZm+nvYJla2KU96FqYyucOl71Ghs2t/6Q6g==
X-Received: by 2002:a17:90b:4f87:: with SMTP id qe7mr40474pjb.77.1644864385890;
        Mon, 14 Feb 2022 10:46:25 -0800 (PST)
Received: from [192.168.122.100] (133-175-21-116.tokyo.ap.gmo-isp.jp. [133.175.21.116])
        by smtp.gmail.com with ESMTPSA id v2sm14583655pjt.55.2022.02.14.10.46.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Feb 2022 10:46:25 -0800 (PST)
Message-ID: <cedb1604-e024-2738-5b33-15703a653803@gmail.com>
Date: Tue, 15 Feb 2022 03:46:18 +0900
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [BUG] mtd: cfi_cmdset_0002: write regression since v4.17-rc1
Content-Language: en-US
To: Ahmad Fatoum <a.fatoum@pengutronix.de>,
 Thorsten Leemhuis <regressions@leemhuis.info>,
 linux-mtd@lists.infradead.org, Joakim.Tjernlund@infinera.com,
 miquel.raynal@bootlin.com, vigneshr@ti.com, richard@nod.at,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, marek.vasut@gmail.com,
 cyrille.pitchen@wedev4u.fr,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linuxppc-dev@lists.ozlabs.org
References: <b687c259-6413-26c9-d4c9-b3afa69ea124@pengutronix.de>
 <dff2abcc-5813-2f2c-35ba-f03cd1f35ac3@leemhuis.info>
 <e11b76dc-5539-fb7e-da1c-a5005713d6b0@gmail.com>
 <3dbbcee5-81fc-cdf5-9f8b-b6ccb95beddc@pengutronix.de>
 <0f2cfcac-83ca-51a9-f92c-ff6495dca1d7@gmail.com>
 <b231b498-c8d2-28af-ce66-db8c168047f7@pengutronix.de>
 <66ee55d9-4f20-6722-6097-e53c2108ea07@gmail.com>
 <579eab10-594c-d6b2-0ddb-ea6ab8e02856@pengutronix.de>
From: Tokunori Ikegami <ikegami.t@gmail.com>
In-Reply-To: <579eab10-594c-d6b2-0ddb-ea6ab8e02856@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Ahmad-san,

On 2022/02/15 1:22, Ahmad Fatoum wrote:
> Hello Tokunori-san,
>
> On 13.02.22 17:47, Tokunori Ikegami wrote:
>> Hi Ahmad-san,
>>
>> Thanks for your confirmations. Sorry for late to reply.
> No worries. I appreciate you taking the time.
>
>> Could you please try the patch attached to disable the chip_good() change as before?
>> I think this should work for S29GL964N since the chip_ready() is used and works as mentioned.
> yes, this resolves my issue:
> Tested-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
Thanks for your testing. I have just sent the patch to review.
>
>>>>> Doesn't seem to be a buffered write issue here though as the writes
>>>>> did work fine before dfeae1073583. Any other ideas?
>>>> At first I thought the issue is possible to be resolved by using the word write instead of the buffered writes.
>>>> Now I am thinking to disable the changes dfeae1073583 partially with any condition if possible.
>>> What seems to work for me is checking if chip_good or chip_ready
>>> and map_word is equal to 0xFF. I can't justify why this is ok though.
>>> (Worst case bus is floating at this point of time and Hi-Z is read
>>> as 0xff on CPU data lines...)
>> Sorry I am not sure about this.
>> I thought the chip_ready() itself is correct as implemented as the data sheet in the past.
>> But it did not work correctly so changed to use chip_good() instead as it is also correct.
> What exactly in the datasheet makes you believe chip_good is not appropriate?
I just mentioned about the actual issue behaviors as not worked 
chip_good() on S29GL964N and not worked chip_ready() on 
MX29GL512FHT2I-11G before etc.
Anyway let me recheck the data sheet details as just checked it again 
quickly but needed more investigation to understand.

Regards,
Ikegami

>
> Cheers,
> Ahmad
>
>
