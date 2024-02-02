Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F5B017C6A
	for <regressions@lists.linux.dev>; Fri,  2 Feb 2024 07:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706860745; cv=none; b=TLWpEItNIBiWwxcHMH6yv1ueQSyPBf/Ukea02Se3NHI25OtE0zM4YBM4kZWjc5zAIt1QJS7ldHM78XXjJKyIP7IsjmvQbHQSoC9qSr25u6k4BKRS6PoEev/6C4VEW0In302FqTW/mQcZqFVWG4gqYOnbECbKYv76oldH8ZDK9Vs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706860745; c=relaxed/simple;
	bh=w8tCpbQ0A1YgNYhQKFY3Za+PAmrvcXk8Bry4ghhpDI0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i/nQ2Rk4yUicqRizTlrSm407vXqX59qrZQlj8n0Mk4jDkBCLhzYDysqbe/71ol7hnCRWWwItpKvYpUh/Bdw5tmvQgbmP5GFnzdigbFMvTw5H5c1N5obXnW9S1Wjumjwd1uEE49AKYoVMksZwIBsVwfzi+Vbg+g2t9e0a4SoJtww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=E6YcqpHf; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="E6YcqpHf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706860742;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ptzZ7yZPPFvC3T/6Mypo9JQzCvFLU0tUQ8aX8kCb+bg=;
	b=E6YcqpHfSkuB62D9ozDiwfxvcltLDtg8TIqx4a0Nn7yC8G23+vmBnpDqeVq+YrKHPNkl5m
	ji3Y8yDTHCRxU7Kxm/5QYkwIhGn5yN4wpe8CFL4BK5BnNpDx2sjowm4WsRJsiykGVR0ZlB
	MUkUhr31xF40/mt6O4KasdrnAYoqFkw=
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-537-EXJ5wntnNg-V4HnHXbeHLw-1; Fri, 02 Feb 2024 02:59:01 -0500
X-MC-Unique: EXJ5wntnNg-V4HnHXbeHLw-1
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-3637fbf4d1eso15309785ab.1
        for <regressions@lists.linux.dev>; Thu, 01 Feb 2024 23:59:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706860741; x=1707465541;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ptzZ7yZPPFvC3T/6Mypo9JQzCvFLU0tUQ8aX8kCb+bg=;
        b=DlaVPG4JBSybExeZIbWDQJbaE8v3MtkEfSGclKoX+XpWGKgE2Uwbz87p1C9/cfT5FX
         32QHqXoFMwaZDmZDw1HDZT7Qsqdp020gxa4wErWh+maKaa/ghRvBaJDyok9aeqm2CvPC
         2iFFRoTEIeB8CBeI5khlgoUuVjcDUMqZBC9CDuym1J6PdV4H6htDcTi6tNt6rITGXGYY
         tIK6JuLJ1v7/4KC46ZEzt5c5rvalbiSJ0kiWvp1jWJzAB7ki+Zz/7y1AuZumfCpekVg9
         dxnONFHCeoOnh2JtQHr/+MlgRqNFEnm3WsrehAsruUhe+VZYlxNyIax82naoeOih+5pQ
         nG1A==
X-Gm-Message-State: AOJu0YwouMZRwmkVRwAdu6IEz9sm5DttXeC0f/hm5aQJbBCiFehlFQXw
	dVBzPlqN0UPtnorOYldekrUU1C6B28RhgzHpFXlSfIGVoZigoBfHi1kPdiZWp+PDk8ok8ys1ENR
	37z8yCM6rcVogZlMHdQShyzzOHOGQt3S0KC+5zCKfjLmy8gOZANnYkYxjDhtS
X-Received: by 2002:a92:d981:0:b0:363:7bc5:727b with SMTP id r1-20020a92d981000000b003637bc5727bmr8120782iln.26.1706860740854;
        Thu, 01 Feb 2024 23:59:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFYmI/5H4LFMJxHc+cmVKY/ZzxbWqy6c1sOkkghhT3cKQ2oxAsfpKcBtUe/6o18bUqG6ORurQ==
X-Received: by 2002:a92:d981:0:b0:363:7bc5:727b with SMTP id r1-20020a92d981000000b003637bc5727bmr8120774iln.26.1706860740609;
        Thu, 01 Feb 2024 23:59:00 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCXn7psG7leaijQtxb5Ad/407m+3IhWCYuJ/F0Pmrw5yhB+1NtIQ7FJF57VQC2eJBwpwcM8UymrQVTogscfpcPvN7Z+v+Kr5Z4Fi632OcvdnLDyh2Nlo90g7N6nB21W6FAQ9+Z+8GxhJMXnktz5NRuFMm9PKlRMb54KyOf++QxulJQ==
Received: from [192.168.43.127] ([109.36.129.188])
        by smtp.gmail.com with ESMTPSA id db5-20020a056e023d0500b0036299f401b6sm430941ilb.71.2024.02.01.23.58.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Feb 2024 23:59:00 -0800 (PST)
Message-ID: <3b18ecca-c6ed-4685-a45a-71c3ffac4f96@redhat.com>
Date: Fri, 2 Feb 2024 08:58:55 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH regression fix 2/2] Input: atkbd - Do not skip
 atkbd_deactivate() when skipping ATKBD_CMD_GETID
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Paul Menzel <pmenzel@molgen.mpg.de>, stable@vger.kernel.org,
 regressions@lists.linux.dev, linux-input@vger.kernel.org
References: <20240126160724.13278-1-hdegoede@redhat.com>
 <20240126160724.13278-3-hdegoede@redhat.com> <Zbx2Cuhfy-rpcvCE@google.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Zbx2Cuhfy-rpcvCE@google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Dmitry,

Thank you for picking up these fixes and
sorry about the breakage.

On 2/2/24 05:56, Dmitry Torokhov wrote:
> On Fri, Jan 26, 2024 at 05:07:24PM +0100, Hans de Goede wrote:
>> After commit 936e4d49ecbc ("Input: atkbd - skip ATKBD_CMD_GETID in
>> translated mode") not only the getid command is skipped, but also
>> the de-activating of the keyboard at the end of atkbd_probe(), potentially
>> re-introducing the problem fixed by commit be2d7e4233a4 ("Input: atkbd -
>> fix multi-byte scancode handling on reconnect").
>>
>> Make sure multi-byte scancode handling on reconnect is still handled
>> correctly by not skipping the atkbd_deactivate() call.
>>
>> Fixes: 936e4d49ecbc ("Input: atkbd - skip ATKBD_CMD_GETID in translated mode")
>> Tested-by: Paul Menzel <pmenzel@molgen.mpg.de>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>>  drivers/input/keyboard/atkbd.c | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/input/keyboard/atkbd.c b/drivers/input/keyboard/atkbd.c
>> index c229bd6b3f7f..7f67f9f2946b 100644
>> --- a/drivers/input/keyboard/atkbd.c
>> +++ b/drivers/input/keyboard/atkbd.c
>> @@ -826,7 +826,7 @@ static int atkbd_probe(struct atkbd *atkbd)
>>  
>>  	if (atkbd_skip_getid(atkbd)) {
>>  		atkbd->id = 0xab83;
>> -		return 0;
>> +		goto deactivate_kbd;
>>  	}
>>  
>>  /*
>> @@ -863,6 +863,7 @@ static int atkbd_probe(struct atkbd *atkbd)
>>  		return -1;
>>  	}
>>  
>> +deactivate_kbd:
>>  /*
>>   * Make sure nothing is coming from the keyboard and disturbs our
>>   * internal state.
> 
> I wonder if we need to do the same for the case when we go into SET LEDS
> branch... This can be done in a separate patch though.

Right my goal with this series was to make the behavior change from
936e4d49ecbc ("Input: atkbd - skip ATKBD_CMD_GETID in translated mode")
as small as possible (just skip ATKBD_CMD_GETID and no other behavior
change like calling SET_LEDS).

I'm not sure about doing the same as this patch for the SET_LEDS
path. We only hit that path if GETID fails which means we are
already dealing with quirky hardware and we already have quirks
to skip the deactivate command for some keyboards which don't
like it...

Let me know if you still want to give making the SET_LEDS
path consistent with the others a go and have it call deactive
too. IMHO that would only be something for -next though,
so that it gets the maximum amount of testing time.

Regards,

Hans

