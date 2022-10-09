Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5523A1C2E
	for <regressions@lists.linux.dev>; Sun,  9 Oct 2022 22:45:31 +0000 (UTC)
Received: by mail-qk1-f171.google.com with SMTP id y1so5832063qky.12
        for <regressions@lists.linux.dev>; Sun, 09 Oct 2022 15:45:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sladewatkins.net; s=googled;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qoQaMugHvTPaZz2yjGnEv+QBAEt4uVbYTr3+LciFdvU=;
        b=F5Vr6E650I+JLLUTWnewNpyX7fwWtKUsQa7o2NeiE7hJKD4TIDPtgMbDwSrXk8EHsG
         wDTaP1m3rKboduR7qUdJ6yGvAB7JktS1Ds0vyNmdHDtez8eSeOPWfrmfXPAYOvnb/Kds
         DQaRHftXs7HjqsCgseJ9tI+5GSM5VpcxUhBKFHum9qp2SJhLbSYj20RS5uR1a37AZcnE
         q+klbA6cFYVQKkz/xdh5nu2GELn+B75niTJTr1DU9Y/7czUIkmo7Cl+KNZuJfJbSuYgB
         cULKoINRmqFn5FQkHHJ8DPc8Ee5i3ywjMokG1YbCd4hJLmKCZfXvUsUVZ1J4hA1rRf73
         xXVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qoQaMugHvTPaZz2yjGnEv+QBAEt4uVbYTr3+LciFdvU=;
        b=UP62JNLoPUd15RXJ106MV00eXN5QAd17XCSMAp3xhRPopkLpSTYRzCOO6c2eNkWsG+
         Vof80LTLUeumNMNQabkEJPEAWqbIQDK7H1Js2LGYFbmQAVXUfzfO5hvREP4uXadZJKdC
         vDz05J59jml5wh8mXMKK13m80vNu15QEkrIGoHO1n7roHERetqgwxJdg43K+CiSSdfqD
         m39rtLcZnweTkp/fQkjS542veBx6Dn077YLuit09okxIiHAIuEmObP/v5vPQXCFPgB3M
         qxWDYJVKLqb+oqCoCuK6A2LG7JmJoZE2bd1Vgf+1ChjW6F50lHwqfUOBavgtQrOJm47s
         E+Kg==
X-Gm-Message-State: ACrzQf3eVM/G25QfVI+iQM9XoLCnQQopzE/nhLIhosAKoxhM5N+rr1s0
	dpUnVd7oSGbvv3hw0zupZkRvQw==
X-Google-Smtp-Source: AMsMyM7ulVL1wQfBPElCtOauV4aLGfpZrVw7iXEYP13XRwFIAyE5UrLSubtIcvNXDYTQVVa5mQBEbA==
X-Received: by 2002:a05:620a:1b89:b0:6ce:8b2b:7f0e with SMTP id dv9-20020a05620a1b8900b006ce8b2b7f0emr11158386qkb.15.1665355530077;
        Sun, 09 Oct 2022 15:45:30 -0700 (PDT)
Received: from [192.168.1.30] (pool-108-4-135-94.albyny.fios.verizon.net. [108.4.135.94])
        by smtp.gmail.com with ESMTPSA id i17-20020ac871d1000000b00397c4528a5bsm4653726qtp.79.2022.10.09.15.45.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Oct 2022 15:45:29 -0700 (PDT)
Message-ID: <b5deaa2e-8867-1e0e-6090-422248310dc1@sladewatkins.net>
Date: Sun, 9 Oct 2022 18:45:28 -0400
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.2
Subject: Re: BUG reproduced: 6.0.0-RC kernels trigger Firefox snap bug with
 6.0.0-rc3 through 6.0.0-rc7
Content-Language: en-US
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: linux-kernel@vger.kernel.org,
 Mirsad Goran Todorovac <mirsad.todorovac@alu.unizg.hr>,
 Marc Miltenberger <marcmiltenberger@gmail.com>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <b0c258c3-6dcf-aade-efc4-d62a8b3a1ce2@alu.unizg.hr>
 <5bb75cbc-a0db-537b-12d0-889230c865d8@leemhuis.info>
 <0fb2a9ff-df76-8af9-e54a-c2dc6bfd9478@leemhuis.info>
 <bdab45d3-c893-42ff-dbb9-5fa93d0dff55@alu.unizg.hr>
 <dd62210d-d095-f971-2b7b-0ec54fd189a9@leemhuis.info>
 <c05134cc-92fa-dac2-e738-cf6fae194521@alu.unizg.hr>
 <6ba15505-1c04-df2b-237f-b3060f26d2e6@leemhuis.info>
 <25cd0e21-ed8e-1836-b0ec-c052c2276cd8@alu.unizg.hr>
 <c40786ab-8b3b-9b64-683f-dac589c024df@alu.unizg.hr>
 <021de720-4a57-1a88-f456-fcaeaa3653de@leemhuis.info>
From: Slade Watkins <srw@sladewatkins.net>
In-Reply-To: <021de720-4a57-1a88-f456-fcaeaa3653de@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi all,

On 10/9/22 at 2:45 AM, Thorsten Leemhuis wrote:
> Yeah, then it's pretty certain that his is a regression. But it could be
> caused by all sorts of things and I have no idea where to start. We thus
> really could need a bisection to find the root of the problem. This will
> be hard, as this crash only happens infrequently. Thing is: the Ubuntu
> developers likely have a strong interest in this particular issue and
> due to their knowledge of snap have way better chances to pin-point the
> root case quickly. So submitting a bug report to them might be the best
> way forward in this situation, even if the kernel is likely at fault here.

Thorsten,
Yeah, agreed. I haven't had time to bisect -- though it's on my list of
things to do: I'm going to try and make time tomorrow. Wish we had more
of an idea of what exactly was happening here.

Mirsad,
I'd be happy to help with a report to the Ubuntu folks. :-)

Best,
-srw

