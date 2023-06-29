Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88E95AD28
	for <regressions@lists.linux.dev>; Thu, 29 Jun 2023 13:53:43 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-3fbc060a2caso4183685e9.3
        for <regressions@lists.linux.dev>; Thu, 29 Jun 2023 06:53:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688046821; x=1690638821;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=alU2vE7E5YcqPkC5rsJXW36Umh03YyH3gOVJxNpCon0=;
        b=WlEgudpri+3HRNwJ6FJrJoAMGoTYRecoYSyYLdazejBdaJHj7QVVl05z7gNaJUPjrX
         wO7qtHceRUzwz5P6s/F8SfCfyk/LOwJAD9IpV5bsJZylmwm6yhxgEmh7SH04FQSbVn8q
         KVqzKC172l1h6WJGbCU1JsIvzd+hmKmj+lwYUaJci42QhYA/u9q3TIo6Y6jTJtwGmAp9
         SYJxS7KF+5TikbDJR7EzTceuz+cX5VUs8CQSD00liWofd7/mBxLMJqosOUsvYB/LP0sd
         Ne3j2ajpQhhWDthEdc35xAK6JM4gt157FjuqnaW0qcR1EX9O8+OJYBpiONpLLMVDLTjU
         npSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688046821; x=1690638821;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=alU2vE7E5YcqPkC5rsJXW36Umh03YyH3gOVJxNpCon0=;
        b=AcFvmSOMDcz7jLPpQkBeyyk2zrmCYJbt6ayEemAiAS8PdyXo0MJIoHYDkEaIT8tfGH
         mDGLf2P5FRszn7pLWNuRlsrHUsZEsqYSkb2T6NfCCmIEg7COJCs++rLC6ZpntFg6s9ZJ
         /dqG9vzqN543Tl1woukC0W4ZZmNgropFON0iMWnh4qtlL6tdvOU9O+duV5uK6Z6Ei7Yn
         2o/NJLE38wO0WqnT9lKfdmvQB/7WCO9pNqCU8yuuHVOE8W56mUU277FkGxO0niRnltRt
         /Dcv76yUDLyRhnqvNh5b9pJaGa/pu2xS7xRQsJ5RltYp/Cz2hfBvw+j6RioiP0bC9Qs5
         auJg==
X-Gm-Message-State: AC+VfDyFXy3UNTKXzJ6v9vLMQCa7fq8QSY1kpMy/tRt28wJMhbYFoPY/
	DYr+rcgaMOV/tqqdF+VouOHjdXiWFvaRAQ==
X-Google-Smtp-Source: ACHHUZ7XqEUHn8sUzc0DdfbdvI1n0ttiO/0b28yCyF000ead28/etK3oa2M32Hk0Sw9xjC1jZuvYYQ==
X-Received: by 2002:a7b:c8d0:0:b0:3fb:404c:15e2 with SMTP id f16-20020a7bc8d0000000b003fb404c15e2mr8106377wml.41.1688046821378;
        Thu, 29 Jun 2023 06:53:41 -0700 (PDT)
Received: from debian ([167.98.27.226])
        by smtp.gmail.com with ESMTPSA id s6-20020a5d4ec6000000b0030ae849c70csm15884736wrv.37.2023.06.29.06.53.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jun 2023 06:53:41 -0700 (PDT)
Date: Thu, 29 Jun 2023 14:53:39 +0100
From: "Sudip Mukherjee (Codethink)" <sudipm.mukherjee@gmail.com>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Kees Cook <keescook@chromium.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	Linus Torvalds <torvalds@linux-foundation.org>,
	regressions@lists.linux.dev
Subject: mainline build failure due to df8fc4e934c1 ("kbuild: Enable
 -fstrict-flex-arrays=3")
Message-ID: <ZJ2M4yqnOCqqGWH0@debian>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi All,

The latest mainline kernel branch fails to build with clang (version 16.0.1), and the errors are like:


drivers/scsi/aacraid/commsup.c:1170:17: error: array index 1 is past the end of the array (that has type 'u8[1]' (aka 'unsigned char[1]'), cast to '__le32 *' (aka 'unsigned int *')) [-Werror,-Warray-bounds]
                                (((__le32 *)aifcmd->data)[1] == cpu_to_le32(3));
                                            ^             ~
drivers/scsi/aacraid/aacraid.h:2621:2: note: array 'data' declared here
        u8 data[1];             /* Undefined length (from kernel viewpoint) */
        ^
drivers/scsi/aacraid/commsup.c:1290:20: error: array index 3 is past the end of the array (that has type 'u8[1]' (aka 'unsigned char[1]'), cast to '__le32 *' (aka 'unsigned int *')) [-Werror,-Warray-bounds]
                                  ((((__le32 *)aifcmd->data)[3]
                                               ^

_______________________________________________________________________


drivers/staging/ks7010/ks_wlan_net.c:1600:34: error: array index 16 is past the end of the array (that has type '__u8[0]' (aka 'unsigned char[0]')) [-Werror,-Warray-bounds]
                                memcpy(&key->tx_mic_key[0], &enc->key[16], 8);
                                                             ^        ~~
./include/linux/fortify-string.h:694:35: note: expanded from macro 'memcpy'
                __struct_size(p), __struct_size(q),                     \
                                                ^
./include/linux/fortify-string.h:96:56: note: expanded from macro '__struct_size'
#define __struct_size(p)        __builtin_dynamic_object_size(p, 0)
                                                              ^
./include/linux/fortify-string.h:638:27: note: expanded from macro '__fortify_memcpy_chk'
        const size_t __q_size = (q_size);                               \
                                 ^~~~~~
./include/uapi/linux/wireless.h:838:2: note: array 'key' declared here
        __u8            key[0];
        ^

_______________________________________________________________________


git bisect pointed to df8fc4e934c1 ("kbuild: Enable -fstrict-flex-arrays=3").

Reverting the commit has fixed the build failure.

I will be happy to test any patch or provide any extra log if needed.

#regzbot introduced: df8fc4e934c12b906d08050d7779f292b9c5c6b5


-- 
Regards
Sudip
